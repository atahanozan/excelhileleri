import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/ui/helper/snackbarhelper.dart';
import 'package:excel_hileleri_mobil/ui/helper/userinfohelper.dart';
import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TakeNotes {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TakeNotes({
    required this.controller,
    required this.className,
    required this.context,
  });
  final TextEditingController controller;
  final String className;
  final BuildContext context;

  Widget takeNewNote() {
    return FloatingActionButton.extended(
      onPressed: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: CustomColors.lightYellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          icon: Text(
            "take notes",
            style: GoogleFonts.windSong(
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
          content: TextField(
            controller: controller,
            textCapitalization: TextCapitalization.sentences,
            style: CustomTextStyle.bodyText,
            maxLines: 15,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: CustomColors.lightRed,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (controller.text.isEmpty) {
                  SnackBarHelper()
                      .showErrSnackBar(context, "Geçerli bir yazı giriniz!");
                } else {
                  _firestore.collection("MyNotes").add({
                    "uid": UserInfoData.uid(),
                    "classname": className,
                    "note": controller.text,
                    "time": DateTime.now().toString(),
                  }).whenComplete(() {
                    Navigator.pop(context);
                    SnackBarHelper()
                        .showCongratsSnackBar(context, "Not kaydedildi!");
                  }).whenComplete(
                    () => controller.clear(),
                  );
                }
              },
              child: Text(
                "Notu Kaydet",
                style: CustomTextStyle.bodyText,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "İptal",
                style: CustomTextStyle.bodyText.copyWith(
                  color: CustomColors.darkRed,
                ),
              ),
            ),
          ],
        ),
      ),
      label: Text(
        "Not Al",
        style: CustomTextStyle.bodyText,
      ),
      icon: const Icon(Icons.edit),
      backgroundColor: CustomColors.darkRed,
    );
  }
}
