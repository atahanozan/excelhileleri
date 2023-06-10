import 'package:excel_hileleri_mobil/services/googleads2.dart';
import 'package:flutter/material.dart';

class AdsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AdsAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: const GoogleAdsDenemeSon(),
    );
  }
}
