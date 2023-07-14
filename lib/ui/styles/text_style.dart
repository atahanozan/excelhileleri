import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle {
  static TextStyle smallHeader = GoogleFonts.abrilFatface(
    fontSize: 16,
  );

  static TextStyle mediumHeader = GoogleFonts.abrilFatface(
    fontSize: 19,
    color: Colors.black,
  );

  static TextStyle largeHeader = GoogleFonts.limelight(
    fontSize: 24,
    color: Colors.black,
  );

  static TextStyle bodyText = GoogleFonts.raleway(
    fontSize: 16,
  );
  static TextStyle bodySmallText = GoogleFonts.raleway(
    fontSize: 14,
  );

  static TextStyle subtitleText = GoogleFonts.raleway(
    fontSize: 12,
  );
}
