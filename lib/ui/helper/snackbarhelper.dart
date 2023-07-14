import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:flutter/material.dart';

class SnackBarHelper {
  void showCongratsSnackBar(BuildContext context, String congrats) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: CustomColors.lightGreen,
        padding: const EdgeInsets.all(15),
        content: Text(
          congrats,
          style: CustomTextStyle.bodyText.copyWith(color: Colors.black87),
        ),
      ),
    );
  }

  void showErrSnackBar(BuildContext context, String err) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: CustomColors.lightRed,
        padding: const EdgeInsets.all(15),
        content: Text(
          err,
          style: CustomTextStyle.bodyText.copyWith(color: Colors.black87),
        ),
      ),
    );
  }

  void showInfoSnackBar(BuildContext context, String info) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: CustomColors.lightBlue,
        padding: const EdgeInsets.all(15),
        content: Text(
          info,
          style: CustomTextStyle.bodyText.copyWith(color: Colors.black87),
        ),
      ),
    );
  }
}
