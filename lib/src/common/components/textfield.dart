import 'package:flutter/material.dart';

class CommonTextField extends StatefulWidget {
  final String? hintText;
  final Color? hintColor;
  final int? maxLines;
  final TextInputType? textInputType;
  final Function(String)? onChange;

  const CommonTextField({
    super.key,
    this.hintText,
    this.hintColor,
    this.onChange,
    this.textInputType = TextInputType.text,
    this.maxLines = 1,
  });

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white),
      keyboardType: widget.textInputType,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: widget.hintColor),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: widget.onChange,
    );
  }
}
