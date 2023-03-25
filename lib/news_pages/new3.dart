import 'package:excel_hileleri_mobil/core/appbar_page.dart';
import 'package:excel_hileleri_mobil/core/socialmedia.dart';
import 'package:excel_hileleri_mobil/project_pages/Languages/news.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsThree extends StatelessWidget {
  const NewsThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarPage(textappbar: ""),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(
                Icons.newspaper_rounded,
                size: 80,
              ),
              title: Text(
                newsTexts.header3,
                style: GoogleFonts.raleway(fontSize: 50),
              ),
              subtitle: Text(
                newsTexts.index3,
                style: GoogleFonts.raleway(fontSize: 16),
              ),
            ),
            const SocialMeadiaChannels()
          ],
        ),
      ),
    );
  }
}
