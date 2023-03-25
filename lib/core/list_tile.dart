import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class listTileWidget extends StatelessWidget {
  const listTileWidget(
      {Key? key, required this.text, required this.page, this.icon})
      : super(key: key);
  final String text;
  final page;
  final icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => page)),
      title: Text(
        text,
        style: GoogleFonts.raleway(fontSize: 16),
      ),
      leading: Icon(icon),
    );
  }
}
