import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {required this.onChanged,
      required this.hintText,
      required this.keyboardType,
      required this.hintTextColor});

  String? hintText;
  Function(String)? onChanged;
  Color? hintTextColor;
  TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      onChanged: onChanged,
      style: GoogleFonts.cairo(color: Colors.black),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.cyan,
          ),
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.cairo(
          color: hintTextColor,
        ),
      ),
    );
  }
}
