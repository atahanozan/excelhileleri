import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:flutter/material.dart';

class CustomAlerDialog extends StatelessWidget {
  const CustomAlerDialog({
    Key? key,
    required this.content,
  }) : super(key: key);

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        height: 200,
        padding: const EdgeInsets.all(15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: CustomColors.lightGreen,
          borderRadius: BorderRadius.circular(20),
        ),
        child: content,
      ),
    );
  }
}
