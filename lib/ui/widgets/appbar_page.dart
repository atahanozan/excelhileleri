// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/auth/enterpage.dart';
import 'package:excel_hileleri_mobil/pages/coins.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppbarPage extends StatefulWidget implements PreferredSizeWidget {
  const AppbarPage({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  State<AppbarPage> createState() => _AppbarPageState();
}

class _AppbarPageState extends State<AppbarPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? uid, name;
  User? user;
  int coin = 0;
  List<String> userName = [];

  @override
  void initState() {
    setState(() {
      user = _auth.currentUser;
      uid = user?.uid;
      name = user?.displayName;
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
    setState(() {
      userName = name!.split(" ");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Hoş Geldin ${userName[0]}"),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      elevation: 0.0,
      titleTextStyle: CustomTextStyle.mediumHeader,
      actions: [
        InkWell(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CoinsPage())),
          child: SizedBox(
            height: 30,
            width: 30,
            child: Image.asset("assets/images/coin.png"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              coin.toString(),
              style: CustomTextStyle.mediumHeader,
            ),
          ),
        ),
      ],
    );
  }
}
