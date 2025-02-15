import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCupertinoTextField extends StatelessWidget {
  const CustomCupertinoTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.maxLines,
  });

  final TextEditingController controller;
  final String hintText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return CupertinoTextField(
      controller: controller,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(bottom: BorderSide(color: primaryColor, width: 1.0)),
      ),
      maxLines: maxLines,
      placeholder: hintText,
      textInputAction: TextInputAction.newline,
    );
  }
}
