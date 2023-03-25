import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FloatingActionButtonCommand extends StatefulWidget {
  const FloatingActionButtonCommand({Key? key}) : super(key: key);

  @override
  State<FloatingActionButtonCommand> createState() =>
      _FloatingActionButtonCommandState();
}

class _FloatingActionButtonCommandState
    extends State<FloatingActionButtonCommand> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.purple,
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  "Lütfen Talebinizi Kısaca Belirtiniz.",
                  style: GoogleFonts.raleway(),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text(
                              "Adınız",
                              style: GoogleFonts.raleway(),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text(
                              "Mail Adresiniz",
                              style: GoogleFonts.raleway(),
                            )),
                      ),
                    ),
                    TextFormField(
                      maxLines: 12,
                      style: GoogleFonts.raleway(),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Talebiniz...")),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Tamam",
                        style: GoogleFonts.raleway(),
                      ))
                ],
              );
            });
      },
      child: const Icon(Icons.message),
    );
  }
}
