import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMeadiaChannels extends StatefulWidget {
  const SocialMeadiaChannels({Key? key}) : super(key: key);

  @override
  State<SocialMeadiaChannels> createState() => _SocialMeadiaChannelsState();
}

class _SocialMeadiaChannelsState extends State<SocialMeadiaChannels> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "AŞAĞIDAKİ KANALLARDAN BİZİMLE İLETİŞİME GEÇEBİLİRSİNİZ.",
              style: GoogleFonts.raleway(
                  fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ),
          const Card(
            child: ListTile(
              onTap: _launchUrlInstagram,
              title: Text("Instagram"),
              leading: FaIcon(
                FontAwesomeIcons.instagram,
                size: 40,
                color: Colors.pink,
              ),
              subtitle: Text("/excelhileleri"),
              trailing: Icon(Icons.arrow_forward_ios_rounded,
                  color: Colors.pink, size: 15),
            ),
          ),
          const Card(
            child: ListTile(
              onTap: _launchUrlYoutube,
              title: Text("YouTube"),
              leading: FaIcon(
                FontAwesomeIcons.youtube,
                size: 40,
                color: Colors.red,
              ),
              subtitle: Text("/vlogbyatahan"),
              trailing: Icon(Icons.arrow_forward_ios_rounded,
                  color: Colors.red, size: 15),
            ),
          ),
          const Card(
            child: ListTile(
              onTap: _launchUrlTwitter,
              title: Text("Twitter"),
              leading: FaIcon(
                FontAwesomeIcons.twitter,
                size: 40,
                color: Colors.blue,
              ),
              subtitle: Text("/excelhileleri"),
              trailing: Icon(Icons.arrow_forward_ios_rounded,
                  size: 15, color: Colors.blue),
            ),
          ),
          const Card(
            child: ListTile(
              onTap: _launchUrlLinkedin,
              title: Text("LinkedIn"),
              leading: FaIcon(FontAwesomeIcons.linkedin,
                  size: 40, color: Colors.blue),
              subtitle: Text("/excelhileleri"),
              trailing: Icon(Icons.arrow_forward_ios_rounded,
                  color: Colors.blue, size: 15),
            ),
          ),
          const Card(
            child: ListTile(
              onTap: _launchUrlTiktok,
              title: Text("Tik Tok"),
              leading: FaIcon(
                FontAwesomeIcons.tiktok,
                size: 40,
                color: Colors.black,
              ),
              subtitle: Text("/excelhileleri"),
              trailing: Icon(Icons.arrow_forward_ios_rounded,
                  color: Colors.black, size: 15),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _launchUrlInstagram() async {
  final Uri _url = Uri.parse("https://www.instagram.com/excelhileleri");
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

Future<void> _launchUrlTwitter() async {
  final Uri _url = Uri.parse("https://www.twitter.com/excelhileleri");
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

Future<void> _launchUrlLinkedin() async {
  final Uri _url =
      Uri.parse("https://www.linkedin.com/in/excel-hileleri-0b0369260/");
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

Future<void> _launchUrlTiktok() async {
  final Uri _url =
      Uri.parse("https://www.tiktok.com/@excelhileleri?_t=8Ybsvh4q9Dy&_r=1");
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

Future<void> _launchUrlYoutube() async {
  final Uri _url = Uri.parse("https://www.youtube.com/@vlogbyatahan");
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}
