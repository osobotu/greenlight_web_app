import 'package:flutter/material.dart';

class GreenlightTextInputField extends StatelessWidget {
  const GreenlightTextInputField({
    super.key,
    required this.labelText,
    this.controller,
  });

  final String labelText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 256,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(labelText: labelText),
      ),
    );
  }
}
