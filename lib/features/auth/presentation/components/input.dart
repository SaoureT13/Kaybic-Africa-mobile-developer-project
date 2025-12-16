import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({
    super.key,
    required this.label,
    this.validator,
    this.controller,
    this.enabled = true,
    this.errorText,
    this.hintText,
  });

  final String label;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final bool enabled;
  final String? errorText;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16, color: Colors.black)),
        const SizedBox(height: 4),
        TextFormField(
          enabled: enabled,
          controller: controller,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xFF006AB0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xFF006AB0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xFF006AB0)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.red),
            ),
            fillColor: enabled
                ? Colors.white
                : Colors.black.withValues(alpha: 0.3),
            filled: true,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Colors.black.withValues(alpha: 0.3),
              ),
            ),
            errorStyle: TextStyle(fontSize: 12, color: Colors.red, height: 1),
            errorMaxLines: 1,
            errorText: errorText,
            hintText: hintText,
          ),
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Outfit",
            fontSize: 18,
            height: 1.2,
          ),
          textAlignVertical: TextAlignVertical.center,
          validator: validator,
        ),
      ],
    );
  }
}
