import 'package:excel_hileleri_mobil/services/googleads2.dart';
import 'package:flutter/material.dart';

class AdsBottomAppBar extends StatelessWidget {
  const AdsBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      child: SizedBox(child: GoogleAdsDenemeSon()),
    );
  }
}
