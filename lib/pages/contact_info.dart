import 'package:excel_hileleri_mobil/ui/widgets/appbar_page.dart';
import 'package:excel_hileleri_mobil/ui/widgets/socialmedia.dart';
import 'package:excel_hileleri_mobil/services/googleads2.dart';
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
      appBar: AppbarPage(),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: ListView(
          children: [
            const GoogleAdsDenemeSon(),
            Center(
              child: Image.asset("assets/contactusnew.png"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "textUtilities.contactusmain",
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
