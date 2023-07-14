import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class EnterPage extends StatefulWidget {
  const EnterPage({super.key});

  @override
  State<EnterPage> createState() => _EnterPageState();
}

class _EnterPageState extends State<EnterPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Color(0xffD1E4DA),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Excel Hileleri\nUygulamasına\nHoş Geldin",
                style: GoogleFonts.limelight(
                  fontSize: 40,
                ),
              ),
              Text(
                "Öğrenmenin en kolay ve eğlenceli hali seni bekliyor. Hemen kayıt olup ya da giriş yapıp Excel Hileleri dünyasına dahil ol.",
                style: CustomTextStyle.bodyText,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize:
                              Size.fromWidth(MediaQuery.of(context).size.width),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, "/login");
                        },
                        child: const Text("Giriş Yap"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize:
                              Size.fromWidth(MediaQuery.of(context).size.width),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, "/register");
                        },
                        child: const Text("Kayıt Ol"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      OutlinedButton(
                          onPressed: () async {
                            final GoogleSignInAccount? googleUser =
                                await GoogleSignIn().signIn();

                            // Obtain the auth details from the request
                            final GoogleSignInAuthentication? googleAuth =
                                await googleUser?.authentication;

                            // Create a new credential
                            final credential = GoogleAuthProvider.credential(
                              accessToken: googleAuth?.accessToken,
                              idToken: googleAuth?.idToken,
                            );

                            // Once signed in, return the UserCredential
                            await FirebaseAuth.instance
                                .signInWithCredential(credential);

                            await _firestore
                                .collection("Users")
                                .doc(googleAuth?.idToken)
                                .set({
                              "name": "Kullanıcı",
                              "email": googleAuth?.accessToken,
                              "coin": 0,
                              "statu": "basic",
                              "birth": "Henüz eklenmedi",
                              "gender": "Henüz eklenmedi",
                              "phone": "Henüz eklenmedi",
                              "traininglevel": "Temel Eğitim Seviyesi",
                              "level": 0,
                            }).whenComplete(() async {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Google ile giriş yapıldı.")));
                              Navigator.pushReplacementNamed(context, "/login");
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            fixedSize: Size.fromWidth(
                                MediaQuery.of(context).size.width),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 30,
                                width: 30,
                                child: Image.asset("assets/images/google.png"),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text("Google ile devam et"),
                            ],
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
