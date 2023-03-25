// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppbarPage extends StatefulWidget implements PreferredSizeWidget {
  AppbarPage({Key? key, required this.textappbar})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  final String textappbar;

  @override
  final Size preferredSize;

  @override
  State<AppbarPage> createState() => _AppbarPageState();
}

class _AppbarPageState extends State<AppbarPage> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      titleTextStyle: GoogleFonts.raleway(fontSize: 20, color: Colors.black),
      title: Text(widget().textappbar),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        "Profil İşlemleri Çok Yakında Sizlerle Olacak.",
                        style: GoogleFonts.raleway(),
                      ),
                    );
                  });
            },
            icon: const Icon(
              Icons.account_circle_rounded,
              size: 40,
            ))
      ],
    );
  }
}
