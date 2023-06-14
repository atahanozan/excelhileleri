import 'package:excel_hileleri_mobil/ui/helper/text_helper.dart';
import 'package:flutter/material.dart';
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
          Stack(
            alignment: Alignment.center,
            children: [
              Image.network(TextUtilities.backGroundUrl),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: _launchUrlInstagram,
                        child: Image.network(TextUtilities.instagramUrl),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: _launchUrlYoutube,
                        child: Image.network(TextUtilities.youtubeUrl),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: _launchUrlLinkedin,
                        child: Image.network(TextUtilities.linkedinUrl),
                      ),
                    ),
                  ],
                ),
              ),
            ],
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

Future<void> _launchUrlLinkedin() async {
  final Uri _url =
      Uri.parse("https://www.linkedin.com/in/excel-hileleri-0b0369260/");
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
