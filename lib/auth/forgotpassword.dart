import 'package:excel_hileleri_mobil/ui/helper/snackbarhelper.dart';
import 'package:excel_hileleri_mobil/ui/helper/text_helper.dart';
import 'package:excel_hileleri_mobil/ui/widgets/customappbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../ui/styles/text_style.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController mailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    mailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xffD1E4DA),
      appBar: const CustomAppBar(title: ""),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Şifremi Unuttum",
              style: CustomTextStyle.largeHeader,
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: mailController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: const Text("E-Mail"),
                hintText: "example@gmail.com",
                labelStyle: CustomTextStyle.bodyText,
                hintStyle: CustomTextStyle.bodyText,
                helperText: TextUtilities.forgotPassword,
                helperMaxLines: 3,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                if (mailController.text.isNotEmpty) {
                  try {
                    _auth.sendPasswordResetEmail(email: mailController.text);
                    SnackBarHelper().showInfoSnackBar(context,
                        "Şifre sıfırlama linki e-mail adresinize gönderilmiştir.");
                    Navigator.pushReplacementNamed(context, "/login");
                  } on FirebaseAuthException catch (e) {
                    SnackBarHelper().showErrSnackBar(context, e.code);
                  }
                } else {
                  SnackBarHelper().showErrSnackBar(context,
                      "Lütfen E-Mail bilgisini eksiksiz ve doğru giriniz.");
                }
              },
              child: const Text("Şifre Gönder"),
            ),
          ],
        ),
      ),
    );
  }
}
