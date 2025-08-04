import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class InputNumberFormatter extends TextInputFormatter {
  InputNumberFormatter({this.maxDigits = 100, this.maxDecimal = 3});

  final int maxDigits;
  final int maxDecimal;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final f = getNumberFormat;
    final String spaceCharacters = f.symbols.GROUP_SEP;
    if (num.tryParse(oldValue.text) != null && f.parse(oldValue.text) < 0) {
      newValue = oldValue.copyWith(text: '0');
    }
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    if (newValue.text.length > maxDigits && newValue.text.length > oldValue.text.length) {
      return oldValue;
    }
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      try {
        final decimalSep = newValue.text.split('').toList().where((element) => element == f.symbols.DECIMAL_SEP);
        if (decimalSep.length > 1) {
          return oldValue;
        }
        if (maxDecimal == 0) {
          if (newValue.text.contains('.')) return oldValue;
        }
        final decimalSplit = newValue.text.split(f.symbols.DECIMAL_SEP);
        if (decimalSplit.length > 1 && decimalSplit[1].length > maxDecimal) {
          return oldValue;
        }

        num number = f.parse(newValue.text.replaceAll(spaceCharacters, ''));

        final newString = f.format(number);
        final List<String> listText = newValue.text.split('').toList();
        final String last = listText.last;
        final String nearLast2 = listText.length >= 2 ? '${listText[listText.length - 2]}$last' : '';
        final String nearList3 = listText.length >= 3 ? '${listText[listText.length - 3]}$nearLast2' : '';
        final int selectionIndexFromTheRight = newValue.text.length - newValue.selection.end;
        return TextEditingValue(
          text: last == '.' || nearLast2 == '.0' || nearList3 == '.00' ? newValue.text : newString,
          selection: TextSelection.collapsed(
              offset: newString.length +
                  (nearList3 == '.00'
                      ? 3
                      : (nearLast2 == '.0'
                          ? 2
                          : last == '.'
                              ? 1
                              : -selectionIndexFromTheRight))),
        );
      } on Exception {
        return oldValue;
      }
    } else {
      return newValue;
    }
  }

  NumberFormat get getNumberFormat => NumberFormat("#,###.###", 'en_US');
}
