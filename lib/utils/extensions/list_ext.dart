extension SortList on List {
  void sortAlpha<E>(String Function(E a) getStringA, String Function(E b) getStringB) {
    sort((a, b) => _compareString(getStringA(a), getStringB(b)));
  }

  int _compareString(String a, String b) {
    for (int i = 0; i < a.length && i < b.length; i++) {
      // So sánh các ký tự không có dấu
      final charA = _removeDiacritics(a[i]);
      final charB = _removeDiacritics(b[i]);
      if (charA != charB) {
        return charA.compareTo(charB);
      }
    }

    // Nếu độ dài của chuỗi không bằng nhau, so sánh theo độ dài
    return a.length - b.length;
  }

  String _removeDiacritics(String str) {
    // Xóa dấu từ ký tự có dấu sang ký tự không dấu
    return str
        .replaceAll(RegExp('[àáảãạăắằẳẵặâấầẩẫậ]'), 'a')
        .replaceAll(RegExp('[èéẻẽẹêếềểễệ]'), 'e')
        .replaceAll(RegExp('[ìíỉĩị]'), 'i')
        .replaceAll(RegExp('[òóỏõọôốồổỗộơớờởỡợ]'), 'o')
        .replaceAll(RegExp('[ùúủũụưứừửữự]'), 'u')
        .replaceAll(RegExp('[ỳýỷỹỵ]'), 'y')
        .replaceAll(RegExp('[đ]'), 'd')
        .replaceAll(RegExp('[ÀÁẢÃẠĂẮẰẲẴẶÂẤẦẨẪẬ]'), 'A')
        .replaceAll(RegExp('[ÈÉẺẼẸÊẾỀỂỄỆ]'), 'E')
        .replaceAll(RegExp('[ÌÍỈĨỊ]'), 'I')
        .replaceAll(RegExp('[ÒÓỎÕỌÔỐỒỔỖỘƠỚỜỞỠỢ]'), 'O')
        .replaceAll(RegExp('[ÙÚỦŨỤƯỨỪỬỮỰ]'), 'U')
        .replaceAll(RegExp('[ỲÝỶỸỴ]'), 'Y')
        .replaceAll(RegExp('[Đ]'), 'D');
  }
}

extension IterableExt<T> on Iterable<T>? {
  bool get isNull {
    return this == null;
  }

  bool get isNullOrEmpty {
    return this == null || this?.isEmpty == true;
  }

  bool get isNotNullAndNotEmpty {
    return this != null && this?.isNotEmpty == true;
  }

  List<T> get getOrEmpty {
    return this == null ? List.empty() : this!.toList();
  }

  List<T>? get getOrNull {
    return isNullOrEmpty ? null : this!.toList();
  }
}
