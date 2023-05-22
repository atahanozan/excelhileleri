import 'package:excel_hileleri_mobil/core/appbar_page.dart';
import 'package:flutter/material.dart';
import '../core/color_contrast.dart';
import 'googleads2.dart';

class CompatitionPages extends StatelessWidget {
  const CompatitionPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarPage(textappbar: "Yarışmalar"),
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
