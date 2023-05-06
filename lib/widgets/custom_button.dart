import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
   CustomButton({required this.buttonText,required this.onPressed});

  VoidCallback onPressed;
  String buttonText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyan, elevation: 4),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: GoogleFonts.cairo(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
