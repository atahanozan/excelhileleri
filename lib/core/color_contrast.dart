import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextColorContrast extends StatelessWidget {
  const TextColorContrast({Key? key, required this.textone, required this.size})
      : super(key: key);
  final String textone;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(textone,
        style: GoogleFonts.raleway(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.purple.shade900
                : Colors.amber.shade200,
            fontSize: size,
            fontWeight: FontWeight.w700));
  }
}
