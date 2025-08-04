import 'package:app/utils/input_number_formatter.dart';

extension StringExt on String? {
  bool get isNullOrEmpty {
    return this == null || this?.isEmpty == true;
  }

  bool get isNotNullAndNotEmpty {
    return !isNullOrEmpty;
  }

  String get formatPhoneNumber {
    if (isNullOrEmpty) return '';
    final phoneNumber = this!;
    if (phoneNumber.length == 11 || phoneNumber.length == 10) {
      return phoneNumber.replaceAllMapped(RegExp(r'(\d{4})(\d{3})(\d+)'), (Match m) => "${m[1]} ${m[2]} ${m[3]}");
    } else {
      return phoneNumber;
    }
  }

  bool get isUrl {
    String pattern = r'^((https?:\/\/|ftp:\/\/)?([\w-]+\.)+[\w-]+|([\w-]+\.)+[\w-])(\/[\w- .\/?%&=]*)?$';
    RegExp regExp = RegExp(pattern);
    if (isNullOrEmpty) return false;
    return regExp.hasMatch(this!);
  }

  bool get isEmail {
    if (isNullOrEmpty) return false;
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this!);
  }
}

extension NumberFormatExt on String {
  num? toNumFromTextPrice([num? defaultValue]) =>
      isNotNullAndNotEmpty ? InputNumberFormatter().getNumberFormat.parse(this) : defaultValue;
}
