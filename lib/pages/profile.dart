import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/widgets/adsappbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  String? name;

  @override
  void initState() {
    setState(() {
      user = _auth.currentUser;
      name = user?.displayName;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AdsAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Flexible(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    name.toString().replaceAll(" ", "\n"),
                    style: GoogleFonts.titanOne(
                      fontSize: 40,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _auth.signOut();
                    Navigator.pushReplacementNamed(context, "/enter");
                  },
                  child: Text("Çıkış"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      user?.updateDisplayName("Atahan Ozan Tokdemir");
                    });
                  },
                  child: Text("İsmi Güncelle"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
