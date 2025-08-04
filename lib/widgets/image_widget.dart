import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:app/utils/snack_bar.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

Widget imageNetwork({
  required String url,
  BoxFit fit = BoxFit.cover,
  Widget? placeHolder,
  double? width,
  double? height,
  BorderRadius? borderRadius,
  bool showFullScreen = true,
}) {
  Widget child = SizedBox(
    width: width,
    height: height,
  );
  child = InkWell(
    onTap: showFullScreen ? () {} : null,
    child: Hero(
      tag: url,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: ExtendedImage.network(url, fit: fit, width: width, height: height),
      ),
    ),
  );
  return child;
}

_downloadImage(
  BuildContext context, {
  required String url,
  required Function(int total, int downloaded, double progress, String name) downloadProgress,
}) =>
    GestureDetector(
      onTap: () async {
        try {
          await _requestPermission();
          final String fileName = 'IMAGE_${Random().nextInt(99999)}';
          await _download(url, (total, downloaded, progress) => downloadProgress(total, downloaded, progress, fileName))
              .then((imageBytes) async {
            var check = await ImageGallerySaver.saveImage(imageBytes, quality: 100, name: fileName);
            if (check['isSuccess']) {
              showTitleSnackBar(context, title: 'Tải ảnh về thư viện thành công', width: 190);
            }
          }).catchError((error) {
            showTitleSnackBar(context, title: 'Tải ảnh không thành công !!!', width: 190);
          });
        } catch (e) {
          showTitleSnackBar(context, title: 'Tải ảnh không thành công !!!', width: 190);
        }
      },
      child: const Padding(
        padding: EdgeInsets.only(top: 8),
        child: Text(
          'Tải xuống',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

Future<Uint8List> _download(String url, Function(int total, int downloaded, double progress) downloadProgress) {
  final completer = Completer<Uint8List>();
  final client = http.Client();
  final request = http.Request('GET', Uri.parse(url));
  final response = client.send(request);

  int downloadedBytes = 0;
  List<List<int>> chunkList = [];

  response.asStream().listen((event) {
    event.stream.listen(
      (chunk) {
        final contentLength = event.contentLength ?? 0;
        final progress = (downloadedBytes / contentLength) * 100;
        downloadProgress(contentLength, downloadedBytes, progress);
        chunkList.add(chunk);
        downloadedBytes += chunk.length;
      },
      onDone: () {
        final contentLength = event.contentLength ?? 0;
        final progress = (downloadedBytes / contentLength) * 100;
        downloadProgress(contentLength, downloadedBytes, progress);

        int start = 0;
        final bytes = Uint8List(contentLength);

        for (var chunk in chunkList) {
          bytes.setRange(start, start + chunk.length, chunk);
          start += chunk.length;
        }
        completer.complete(bytes);
      },
      onError: (error) => completer.completeError(error),
    );
  });
  return completer.future;
}

_requestPermission() async {
  Map<Permission, PermissionStatus> statuses = await [
    Permission.storage,
  ].request();
  final info = statuses[Permission.storage].toString();
  debugPrint(info);
}
