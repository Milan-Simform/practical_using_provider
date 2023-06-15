import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PRTextField extends TextFormField {
  PRTextField(
      {super.key,
      required String title,
      String? hintText,
      required TextEditingController controller,
      TextInputType? keyboardType,
      int? maxLines = 1,
      List<TextInputFormatter>? inputFormatters,
      TextInputAction? textInputAction,
      int? maxLength,
      String? Function(String?)? validator})
      : super(
            controller: controller,
            validator: validator,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            maxLines: maxLines,
            textInputAction: textInputAction,
            maxLength: maxLength,
            decoration: InputDecoration(labelText: title, hintText: hintText));
}
