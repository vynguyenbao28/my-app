import 'package:app/widgets/line.dart';
import 'package:flutter/material.dart';

part '_title.dart';

class SelectDate extends StatefulWidget {
  final EdgeInsets? margin;
  final DateTime? initialFromDate;
  final DateTime? initialToDate;
  final Function(String fromDate, String toDate) onChanged;

  const SelectDate({
    super.key,
    this.margin,
    required this.onChanged,
    this.initialFromDate,
    this.initialToDate,
  });

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  @override
  Widget build(BuildContext context) {
    const Color strokeColor = Color(0xffc2c2c2);
    return Container(
      margin: widget.margin,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: strokeColor),
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
          // boxShadow: [Utils.mediumBoxShadow],
        ),
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            _dateTitle(title: 'Từ', date: _fromDate, onPressed: fromDate),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 1, color: strokeColor)),
              child: const Icon(Icons.date_range, size: 20, color: Colors.black),
            ),
            _dateTitle(title: 'Đến', date: _toDate, onPressed: toDate),
            InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {
                if (_fromDate != '' && _toDate != '') {
                  widget.onChanged('', '');
                }
                setState(() {
                  _fromDate = '';
                  _toDate = '';
                  _initialFromDate = DateTime.now();
                  _initialToDate = DateTime.now();
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: const Icon(Icons.close, color: Colors.blue, size: 20),
              ),
            )
          ],
        ),
      ),
    );
  }

  String _fromDate = '';
  String _toDate = '';

  DateTime _initialFromDate = DateTime.now();
  DateTime _initialToDate = DateTime.now();

  @override
  void initState() {
    if (widget.initialFromDate != null) {
      _initialFromDate = widget.initialFromDate!;
    }
    if (widget.initialToDate != null) {
      _initialToDate = widget.initialToDate!;
    }
    super.initState();
  }

  Future<void> fromDate() async {
    final picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2022),
        lastDate: DateTime.now(),
        locale: const Locale('vi'),
        initialDate: _initialFromDate.compareTo(_initialToDate) > 0 ? _initialToDate : _initialFromDate,
        currentDate: _initialToDate,
        selectableDayPredicate: (dateTime) {
          if (_toDate != '') {
            if (dateTime.compareTo(_initialToDate) > 0) {
              return false;
            }
          }
          return true;
        });
    if (picked != null) {
      setState(() {
        _initialFromDate = picked;
        if (_toDate != '') {
          widget.onChanged(
            _initialFromDate.toIso8601String(),
            _initialToDate.toIso8601String(),
          );
        }
      });
    }
  }

  Future<void> toDate() async {
    final picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2022),
        lastDate: DateTime.now(),
        locale: const Locale('vi'),
        initialDate: _initialToDate,
        currentDate: _initialFromDate,
        selectableDayPredicate: (dateTime) {
          if (_fromDate != '') {
            if (dateTime.compareTo(_initialFromDate) < 0) {
              return false;
            }
          }
          return true;
        });
    if (picked != null) {
      setState(() {
        _initialToDate = picked;
        if (_fromDate != '') {
          widget.onChanged(
            _initialFromDate.toIso8601String(),
            _initialToDate.toIso8601String(),
          );
        }
      });
    }
  }
}
