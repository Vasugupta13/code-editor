import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final String title;
  const CustomButton({super.key, this.onPressed, this.backgroundColor = Colors.white, this.foregroundColor = Colors.black, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          textStyle: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w500)
      ),
      onPressed:onPressed,
      child: Text(title),
    );
  }
}
