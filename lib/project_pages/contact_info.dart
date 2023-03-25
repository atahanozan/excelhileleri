import 'package:excel_hileleri_mobil/core/appbar_page.dart';
import 'package:excel_hileleri_mobil/core/socialmedia.dart';
import 'package:excel_hileleri_mobil/project_pages/Languages/laguages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({Key? key}) : super(key: key);

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarPage(
        textappbar: "",
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: ListView(
          children: [
            Center(
              child: Image.asset("assets/contactusnew.png"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                textUtilities.contactusmain,
                style: GoogleFonts.raleway(fontSize: 16),
              ),
            ),
            const SocialMeadiaChannels(),
          ],
        ),
      ),
    );
  }
}
