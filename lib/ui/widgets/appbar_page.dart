// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:excel_hileleri_mobil/pages/coins.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:flutter/material.dart';

class AppbarPage extends StatefulWidget implements PreferredSizeWidget {
  const AppbarPage({
    Key? key,
    required this.coin,
    required this.name,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  final String name;
  final int coin;

  @override
  final Size preferredSize;

  @override
  State<AppbarPage> createState() => _AppbarPageState();
}

class _AppbarPageState extends State<AppbarPage> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Hoş Geldin ${widget.name.split(" ")[0]}"),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      elevation: 0.0,
      titleTextStyle: CustomTextStyle.mediumHeader,
      actions: [
        InkWell(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CoinsPage())),
          child: SizedBox(
            height: 30,
            width: 30,
            child: Image.asset("assets/images/coin.png"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              widget.coin.toString(),
              style: CustomTextStyle.mediumHeader,
            ),
          ),
        ),
      ],
    );
  }
}
