import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
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
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: CustomColors.lightYellow,
            ),
            child: ListTile(
              onTap: _launchUrlInstagram,
              title: Text(
                "Instagram",
                style: CustomTextStyle.bodyText,
              ),
              subtitle: Text(
                "/excelhileleri",
                style: CustomTextStyle.subtitleText,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: CustomColors.lightYellow,
            ),
            child: ListTile(
              onTap: _launchUrlYoutube,
              title: Text(
                "YouTube",
                style: CustomTextStyle.bodyText,
              ),
              subtitle: Text(
                "/vlogbyatahan",
                style: CustomTextStyle.subtitleText,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: CustomColors.lightYellow,
            ),
            child: ListTile(
              onTap: _launchUrlTwitter,
              title: Text(
                "Twitter",
                style: CustomTextStyle.bodyText,
              ),
              subtitle: Text(
                "/excelhileleri",
                style: CustomTextStyle.subtitleText,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: CustomColors.lightYellow,
            ),
            child: ListTile(
              onTap: _launchUrlLinkedin,
              title: Text(
                "LinkedIn",
                style: CustomTextStyle.bodyText,
              ),
              subtitle: Text(
                "/excelhileleri",
                style: CustomTextStyle.subtitleText,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: CustomColors.lightYellow,
            ),
            child: ListTile(
              onTap: _launchUrlTiktok,
              title: Text(
                "Tik Tok",
                style: CustomTextStyle.bodyText,
              ),
              subtitle: Text(
                "/excelhileleri",
                style: CustomTextStyle.subtitleText,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
              ),
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
