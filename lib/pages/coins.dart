import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/ui/helper/text_helper.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:excel_hileleri_mobil/ui/widgets/customappbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoinsPage extends StatefulWidget {
  const CoinsPage({super.key});

  @override
  State<CoinsPage> createState() => _CoinsPageState();
}

class _CoinsPageState extends State<CoinsPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int coin = 0;
  User? user;
  String? uid;

  @override
  void initState() {
    setState(() {
      user = _auth.currentUser;
      uid = user?.uid;
    });
    _firestore
        .collection("Users")
        .doc(uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      setState(() {
        coin = snapshot["coin"];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "EH Coin"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset("assets/logo.png"),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Mevcut EH Coinleriniz",
                style: CustomTextStyle.largeHeader,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset("assets/images/coin.png")),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    coin.toString(),
                    style: GoogleFonts.anton(
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                TextUtilities.coinsExplain,
                style: CustomTextStyle.subtitleText,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
