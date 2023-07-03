import 'package:flutter/material.dart';

class GreenlightTextInputField extends StatelessWidget {
  const GreenlightTextInputField({
    super.key,
    required this.labelText,
  });

  final String labelText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 256,
      child: TextFormField(
        decoration: InputDecoration(labelText: labelText),
      ),
    );
  }
}
