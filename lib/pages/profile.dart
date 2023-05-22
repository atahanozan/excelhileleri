
import 'package:excel_hileleri_mobil/core/appbar_page.dart';
import 'package:excel_hileleri_mobil/core/color_contrast.dart';
import 'package:flutter/material.dart';
import 'googleads2.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarPage(textappbar: "Profil"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Column(children: [
            const GoogleAdsDenemeSon(),
            Expanded(child: Image.asset("assets/comingsoon.png")),
            const Expanded(
              child: FittedBox(
                fit: BoxFit.contain,
                child: TextColorContrast(
                    textone: "Yakında \nHizmetinizdeyiz...", size: 50),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
