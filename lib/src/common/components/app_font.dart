import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFont extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  const AppFont(
    this.text, {
    super.key,
    this.color = Colors.white,
    this.size,
    this.textAlign,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.notoSans(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
