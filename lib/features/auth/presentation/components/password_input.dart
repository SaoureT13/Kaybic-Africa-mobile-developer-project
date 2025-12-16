import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({
    super.key,
    required this.label,
    this.validator,
    this.controller,
    this.enabled = true,
    this.hintText,
  });

  final String label;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final bool enabled;
  final String? hintText;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: TextStyle(fontSize: 16, color: Colors.black)),
        const SizedBox(height: 4),
        TextFormField(
          enabled: widget.enabled,
          controller: widget.controller,
          obscureText: _obscureText,
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
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.black,
              ),
              onPressed: _togglePasswordVisibility,
            ),

            fillColor: widget.enabled
                ? Colors.white
                : Colors.black.withValues(alpha: 0.3),
            filled: true,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xFF006AB0)),
            ),
            errorStyle: TextStyle(fontSize: 12, color: Colors.red),
            errorMaxLines: 1,
            hintText: widget.hintText,
          ),
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Outfit",
            fontSize: 18,
            height: 1.2,
          ),
          textAlignVertical: TextAlignVertical.center,
          validator: widget.validator,
        ),
      ],
    );
  }
}
