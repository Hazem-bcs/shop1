import 'package:flutter/material.dart';

class TextParagraphField extends StatelessWidget {
  const TextParagraphField({
    super.key,
    required this.maxLines,
    required this.minLines,
    required this.maxLength,

    this.validator, this.onSaved, this.initialValue,

  });

  final int maxLines;
  final int minLines;
  final int maxLength;
  final String? initialValue;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onSaved: onSaved,
      validator: validator,
      keyboardType: TextInputType.streetAddress,
      maxLength: maxLength,
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: const BorderSide(width: 4),
              borderRadius: BorderRadius.circular(5))),
    );
  }
}