extension MapExt on Map<String, dynamic> {
  void removeNullAndEmpty() {
    removeWhere((key, value) => _isRemove(value));
    forEach((key, value) {
      try {
        try {
          value.forEach((element) {
            element.removeWhere((key, value) => _isRemove(value));
          });
        } catch (_) {}
        value.removeWhere((key, value) => _isRemove(value));
      } catch (_) {}
    });
  }

  bool _isRemove(dynamic value) =>
      value == null || value == '' || (value is List && value.isEmpty) || (value is Map && value.isEmpty);
}
