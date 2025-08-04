import 'package:flutter/material.dart';

class CircularIndicatorWidget extends StatelessWidget {
  const CircularIndicatorWidget({super.key, this.size = 32});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            backgroundColor: Colors.blue.shade50,
            color: Colors.blue.shade500,
          ),
        ),
      ],
    );
  }
}
