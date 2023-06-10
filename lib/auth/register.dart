import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/ui/helper/text_helper.dart';
import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:excel_hileleri_mobil/ui/widgets/customappbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordAgainController = TextEditingController();
  bool password = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordAgainController.dispose();
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
                "Kayıt Ol",
                style: CustomTextStyle.largeHeader,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Bilgilerin tamamını eksiksiz bir şekilde doldurduğunuzdan emin olunuz.",
                style: CustomTextStyle.subtitleText,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  icon: const Icon(Icons.account_circle_rounded),
                  label: const Text("Ad Soyad"),
                  border: const OutlineInputBorder(),
                  hintText: "Ozan Tokdemir",
                  labelStyle: CustomTextStyle.bodyText,
                  hintStyle: CustomTextStyle.bodyText,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  icon: const Icon(Icons.email_rounded),
                  label: const Text("E-Mail"),
                  border: const OutlineInputBorder(),
                  hintText: "example@example.com",
                  labelStyle: CustomTextStyle.bodyText,
                  hintStyle: CustomTextStyle.bodyText,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                obscureText: password,
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  icon: const Icon(Icons.password_rounded),
                  label: const Text("Şifre"),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        password = !password;
                      });
                    },
                    icon: Icon(
                      password == true
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded,
                    ),
                  ),
                  border: const OutlineInputBorder(),
                  helperText: "Şifreniz en az 8 karakterde olmalıdır.",
                  labelStyle: CustomTextStyle.bodyText,
                  hintStyle: CustomTextStyle.bodyText,
                  helperStyle: CustomTextStyle.subtitleText,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                obscureText: password,
                controller: passwordAgainController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  icon: const Icon(Icons.password_rounded),
                  label: const Text("Şifre Tekrar"),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        password = !password;
                      });
                    },
                    icon: Icon(
                      password == true
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded,
                    ),
                  ),
                  border: const OutlineInputBorder(),
                  labelStyle: CustomTextStyle.bodyText,
                  hintStyle: CustomTextStyle.bodyText,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (nameController.text.isEmpty &&
                      emailController.text.isEmpty &&
                      passwordController.text.isEmpty &&
                      passwordAgainController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(TextUtilities.errEksikBilgi)));
                  } else {
                    if (passwordController.text !=
                        passwordAgainController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(TextUtilities.errEslesmeyenSifre)));
                    } else {
                      try {
                        final user = await _auth.createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        await user.user?.updateDisplayName(nameController.text);
                        await _firestore
                            .collection("Users")
                            .doc(user.user!.uid)
                            .set({
                          "name": nameController.text,
                          "email": emailController.text,
                          "coin": 0,
                          "statu": "basic",
                        }).whenComplete(() async {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(TextUtilities.registered)));
                          Navigator.pushReplacementNamed(context, "/login");
                        });
                      } on FirebaseAuthException catch (err) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(err.code == "weak-password"
                                ? TextUtilities.errWeekPassword
                                : err.code == "invalid-email"
                                    ? TextUtilities.errInvalidEmail
                                    : err.code == "email-already-in-use"
                                        ? TextUtilities.errEmaliAlreadyUse
                                        : "Bilgileri kontrol ederek tekrar deneyiniz.")));
                      }
                    }
                  }
                },
                child: const Text("Kayıt Ol"),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Kayıt olarak ",
                        style: CustomTextStyle.subtitleText,
                      ),
                      Text(
                        "Kullanım Şartları",
                        style: CustomTextStyle.subtitleText,
                      ),
                      Text(
                        " ve ",
                        style: CustomTextStyle.subtitleText,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "KVKK Kurallarını",
                        style: CustomTextStyle.subtitleText,
                      ),
                      Text(
                        " kabul etmiş olursunuz.",
                        style: CustomTextStyle.subtitleText,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
