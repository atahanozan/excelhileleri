import 'package:excel_hileleri_mobil/project_pages/Languages/laguages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class ReadMoretextAboutus extends StatelessWidget {
  const ReadMoretextAboutus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      (textUtilities.ehAboutUs),
      style: GoogleFonts.raleway(
          color: Theme.of(context).brightness == Brightness.light
              ? Color(0xFF005c6c)
              : Colors.blue.shade700),
      trimLines: 3,
      trimMode: TrimMode.Line,
      trimExpandedText: "less",
      trimCollapsedText: "more",
      moreStyle:
          TextStyle(fontWeight: FontWeight.bold, color: Colors.red.shade700),
      lessStyle:
          TextStyle(fontWeight: FontWeight.bold, color: Colors.red.shade700),
    );
  }
}
