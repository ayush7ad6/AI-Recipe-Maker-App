import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyType;
  final FormFieldValidator<String>? validator;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final InputDecoration? decoration;

  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.keyType,
      this.validator,
      this.errorText,
      this.decoration,
      this.readOnly = false,
      this.inputFormatters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyType ?? TextInputType.text,
      controller: controller,
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
      inputFormatters: inputFormatters,
      readOnly: readOnly,
      decoration: decoration ??
          InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(color: Colors.black, width: .75),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(color: Colors.black, width: 0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            filled: true,
            errorText: errorText,
            fillColor: const Color(0xffF5F6FA),
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
    );
  }
}
