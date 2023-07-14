import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:flutter/material.dart';

class DialogHelper {
  void infoDialog(BuildContext context, String info) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              actionsAlignment: MainAxisAlignment.center,
              icon: const Icon(
                Icons.info,
                color: CustomColors.lightBlue,
                size: 42,
              ),
              content: Text(
                info,
                style: CustomTextStyle.bodyText,
                textAlign: TextAlign.center,
              ),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Tamam",
                    style: CustomTextStyle.bodyText,
                  ),
                ),
              ],
            ));
  }

  void errDialog(BuildContext context, String err) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              actionsAlignment: MainAxisAlignment.center,
              icon: const Icon(
                Icons.error,
                color: CustomColors.lightRed,
                size: 42,
              ),
              content: Text(
                err,
                style: CustomTextStyle.bodyText,
                textAlign: TextAlign.center,
              ),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Tamam",
                    style: CustomTextStyle.bodyText,
                  ),
                ),
              ],
            ));
  }

  void congratsDialog(BuildContext context, String congrats) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              actionsAlignment: MainAxisAlignment.center,
              icon: const Icon(
                Icons.check_circle,
                color: CustomColors.lightGreen,
                size: 42,
              ),
              content: Text(
                congrats,
                style: CustomTextStyle.bodyText,
                textAlign: TextAlign.center,
              ),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Tamam",
                    style: CustomTextStyle.bodyText,
                  ),
                ),
              ],
            ));
  }

  void choicesDialog(
      BuildContext context, String content, String btn, VoidCallback func) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              actionsAlignment: MainAxisAlignment.center,
              icon: const Icon(
                Icons.question_mark,
                color: CustomColors.darkRed,
                size: 42,
              ),
              content: Text(
                content,
                style: CustomTextStyle.bodyText,
                textAlign: TextAlign.center,
              ),
              actions: [
                ElevatedButton(
                  onPressed: func,
                  child: Text(
                    btn,
                    style: CustomTextStyle.bodyText,
                  ),
                ),
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "İptal",
                      style: CustomTextStyle.bodyText
                          .copyWith(color: CustomColors.darkRed),
                    ))
              ],
            ));
  }
}
