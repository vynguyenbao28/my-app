/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $EnvironmentGen {
  const $EnvironmentGen();

  /// File path: environment/environment_dev.json
  String get environmentDev => 'environment/environment_dev.json';

  /// File path: environment/environment_prod.json
  String get environmentProd => 'environment/environment_prod.json';

  /// List of all assets
  List<String> get values => [environmentDev, environmentProd];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/logo_login.png
  AssetGenImage get logoLogin =>
      const AssetGenImage('assets/images/logo_login.png');

  /// File path: assets/images/placeholder.jpeg
  AssetGenImage get placeholder =>
      const AssetGenImage('assets/images/placeholder.jpeg');

  /// File path: assets/images/reminder.png
  AssetGenImage get reminder =>
      const AssetGenImage('assets/images/reminder.png');

  /// List of all assets
  List<AssetGenImage> get values => [logo, logoLogin, placeholder, reminder];
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/arrow-down.svg
  SvgGenImage get arrowDown => const SvgGenImage('assets/svgs/arrow-down.svg');

  /// File path: assets/svgs/arrow-right.svg
  SvgGenImage get arrowRight =>
      const SvgGenImage('assets/svgs/arrow-right.svg');

  /// File path: assets/svgs/camera-2.svg
  SvgGenImage get camera2 => const SvgGenImage('assets/svgs/camera-2.svg');

  /// File path: assets/svgs/camera.svg
  SvgGenImage get camera => const SvgGenImage('assets/svgs/camera.svg');

  /// File path: assets/svgs/close.svg
  SvgGenImage get close => const SvgGenImage('assets/svgs/close.svg');

  /// File path: assets/svgs/copy.svg
  SvgGenImage get copy => const SvgGenImage('assets/svgs/copy.svg');

  /// File path: assets/svgs/en.svg
  SvgGenImage get en => const SvgGenImage('assets/svgs/en.svg');

  /// File path: assets/svgs/image.svg
  SvgGenImage get image => const SvgGenImage('assets/svgs/image.svg');

  /// File path: assets/svgs/multiple-image.svg
  SvgGenImage get multipleImage =>
      const SvgGenImage('assets/svgs/multiple-image.svg');

  /// File path: assets/svgs/search.svg
  SvgGenImage get search => const SvgGenImage('assets/svgs/search.svg');

  /// File path: assets/svgs/vi.svg
  SvgGenImage get vi => const SvgGenImage('assets/svgs/vi.svg');

  /// File path: assets/svgs/video.svg
  SvgGenImage get video => const SvgGenImage('assets/svgs/video.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        arrowDown,
        arrowRight,
        camera2,
        camera,
        close,
        copy,
        en,
        image,
        multipleImage,
        search,
        vi,
        video
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
  static const $EnvironmentGen environment = $EnvironmentGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
