import 'package:excel_hileleri_mobil/ui/helper/text_helper.dart';
import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:excel_hileleri_mobil/ui/widgets/customappbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userPasswordController = TextEditingController();
  bool passwordStatu = true;

  @override
  void dispose() {
    userNameController.dispose();
    userPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(title: ""),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: CustomColors.lightGreen,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Giriş Yap",
                style: CustomTextStyle.largeHeader,
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: userNameController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  label: const Text("E-Mail"),
                  hintText: "example@gmail.com",
                  labelStyle: CustomTextStyle.bodyText,
                  hintStyle: CustomTextStyle.bodyText,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                obscureText: passwordStatu,
                controller: userPasswordController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  label: const Text("Şifre"),
                  labelStyle: CustomTextStyle.bodyText,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        passwordStatu = !passwordStatu;
                      });
                    },
                    icon: Icon(
                      passwordStatu == true
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (userNameController.text.isEmpty &&
                      userPasswordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(TextUtilities.errEksikBilgi)));
                  } else {
                    try {
                      await _auth
                          .signInWithEmailAndPassword(
                              email: userNameController.text,
                              password: userPasswordController.text)
                          .whenComplete(
                            () => Navigator.pushReplacementNamed(
                                context, "/home"),
                          );
                    } on FirebaseAuthException catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            error.code == "invalid-email"
                                ? TextUtilities.errInvalidEmail
                                : error.code == "wrong-password"
                                    ? TextUtilities.errWrongPassword
                                    : error.code == "user-not-found"
                                        ? TextUtilities.errUserNotFound
                                        : "Bilgileri kontrol ederek tekrar deneyiniz.",
                          ),
                        ),
                      );
                    }
                  }
                },
                child: const Text("Giriş Yap"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/forgotpassword");
                },
                child: const Text("Şifremi Unuttum"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
