import 'package:app/widgets/on_tap_ripple.dart';
import 'package:flutter/material.dart';

class CommonTextFormField extends StatefulWidget {
  final String? text;
  final String? label;
  final String? hintText;
  final ValueChanged<String> onChanged;
  final bool autofocus;
  final TextInputType? textInputType;
  final bool disable;
  final Widget? suffixIcon;
  final double height;
  final FormFieldValidator? validator;

  const CommonTextFormField({
    super.key,
    this.text,
    this.label,
    this.hintText,
    required this.onChanged,
    this.autofocus = false,
    this.textInputType,
    this.disable = false,
    this.suffixIcon,
    this.height = 45,
    this.validator,
  });

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: isError ? Colors.red : Colors.grey),
      ),
      child: TextFormField(
        controller: controller,
        onChanged: widget.onChanged,
        autofocus: widget.autofocus,
        keyboardType: widget.textInputType,
        enabled: true,
        focusNode: focusNode,
        readOnly: widget.disable,
        validator: (text) {
          if (widget.validator != null && isError != (widget.validator!(controller.text) == null)) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {
                isError = widget.validator?.call(controller.text) == null;
              });
            });
          }
          return widget.validator?.call(text);
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            disabledBorder: inputBorder,
            enabledBorder: inputBorder,
            errorBorder: inputBorder,
            focusedBorder: inputBorder,
            border: inputBorder,
            filled: false,
            hintText: widget.hintText,
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (hasFocus && controller.text.isNotEmpty)
                  OnTapRipple(
                    radius: 30,
                    margin: const EdgeInsets.only(right: 8),
                    onTap: () {
                      widget.onChanged('');
                      controller.clear();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.cancel, color: Colors.grey),
                    ),
                  ),
                widget.suffixIcon ?? Container()
              ],
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16)),
      ),
    );
  }

  late final TextEditingController controller = TextEditingController(text: widget.text);
  final OutlineInputBorder inputBorder = const OutlineInputBorder(borderSide: BorderSide.none);
  final FocusNode focusNode = FocusNode();
  late bool hasFocus = widget.autofocus;
  late bool isError = false;
  late String currentText = controller.text;

  @override
  void initState() {
    controller.addListener(() {
      if ((currentText.isEmpty && controller.text.isNotEmpty) || (currentText.isNotEmpty && controller.text.isEmpty)) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() {
            currentText = controller.text;
          });
        });
      }
    });
    focusNode.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          hasFocus = focusNode.hasFocus;
        });
      });
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CommonTextFormField oldWidget) {
    if (widget.text != null) {
      final selection = controller.selection;
      controller.value = TextEditingValue(text: widget.text!, selection: selection);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }
}
