import 'package:excel_hileleri_mobil/core/appbar_page.dart';
import 'package:excel_hileleri_mobil/core/color_contrast.dart';
import 'package:excel_hileleri_mobil/project_pages/Languages/laguages.dart';
import 'package:excel_hileleri_mobil/project_pages/contact_info.dart';
import 'package:excel_hileleri_mobil/project_pages/googleads2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUssSection extends StatefulWidget {
  const AboutUssSection({Key? key}) : super(key: key);

  @override
  State<AboutUssSection> createState() => _AboutUssSectionState();
}

class _AboutUssSectionState extends State<AboutUssSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarPage(
        textappbar: "Hakkımızda",
      ),
      body: ListView(children: [
        const GoogleAdsDenemeSon(),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 280,
                  child: const TextColorContrast(
                    textone: "Excel Hileleri",
                    size: 80,
                  ),
                ),
                Text(
                  textUtilities.ehAboutUs,
                  style: GoogleFonts.raleway(fontSize: 16),
                ),
                Center(
                  child: Stack(
                    children: [
                      Image.asset('assets/aboutusnew.png'),
                      Padding(
                        padding: const EdgeInsets.only(top: 100, left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              textUtilities.nameAot,
                              style: GoogleFonts.raleway(
                                  fontSize: 18, color: Colors.white70),
                            ),
                            Text(textUtilities.jobAot,
                                style:
                                    GoogleFonts.raleway(color: Colors.white70)),
                            TextButton(
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ContactInfo())),
                                style: TextButton.styleFrom(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.zero,
                                    foregroundColor: const Color(0xFF005c6c)),
                                child: const Text("İletişim"))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ]),
        ),
      ]),
    );
  }
}
