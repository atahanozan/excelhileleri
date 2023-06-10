import 'dart:async';

import 'package:excel_hileleri_mobil/pages/mainpage.dart';
import 'package:excel_hileleri_mobil/pages/mytrainings.dart';
import 'package:excel_hileleri_mobil/pages/notifications.dart';
import 'package:excel_hileleri_mobil/pages/profile.dart';
import 'package:excel_hileleri_mobil/services/firebase_messaging.dart';
import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:excel_hileleri_mobil/ui/widgets/appbar_page.dart';
import 'package:excel_hileleri_mobil/ui/widgets/bottomnavbarbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _service = FirebaseMessagingHelper();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? uid;
  User? user;

  @override
  void initState() {
    setState(() {
      user = _auth.currentUser;
      uid = user?.uid;
      _service.connectNotification(context, uid.toString());
    });
    super.initState();
  }

  Widget page = const MainPage();
  int value = 1;
  Color iconColor = const Color(0xffFF763D);
  String header = "";
  bool visibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarPage(),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        notchMargin: 10,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(
                visible: visibility,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: Text(
                    header,
                    style: CustomTextStyle.bodyText.copyWith(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xffFFF8E1),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BottomNavBarButton(
                      color: value == 1 ? Colors.white : CustomColors.darkRed,
                      func: () {
                        setState(() {
                          value = 1;
                          page = const MainPage();
                          header = "Ana Sayfa";
                          visibility = true;
                        });
                        Timer(const Duration(seconds: 2), () {
                          setState(() {
                            visibility = false;
                          });
                        });
                      },
                      icon: Icons.home_rounded,
                      shadowColor: value == 1
                          ? CustomColors.lightRed
                          : Colors.transparent,
                      visible: value == 1 ? true : false,
                    ),
                    BottomNavBarButton(
                      color: value == 2 ? Colors.white : CustomColors.darkRed,
                      func: () {
                        setState(() {
                          value = 2;
                          page = const MyTrainingsPage();
                          header = "Eğitimlerim";
                          visibility = true;
                        });
                        Timer(const Duration(seconds: 2), () {
                          setState(() {
                            visibility = false;
                          });
                        });
                      },
                      icon: Icons.book_rounded,
                      shadowColor: value == 2
                          ? CustomColors.lightRed
                          : Colors.transparent,
                      visible: value == 2 ? true : false,
                    ),
                    BottomNavBarButton(
                      color: value == 3 ? Colors.white : CustomColors.darkRed,
                      func: () {
                        setState(() {
                          value = 3;
                          page = const NotificationsPage();
                          header = "Bildirimler";
                          visibility = true;
                        });
                        Timer(const Duration(seconds: 2), () {
                          setState(() {
                            visibility = false;
                          });
                        });
                      },
                      icon: Icons.notifications_rounded,
                      shadowColor: value == 3
                          ? CustomColors.lightRed
                          : Colors.transparent,
                      visible: value == 3 ? true : false,
                    ),
                    BottomNavBarButton(
                      color: value == 4 ? Colors.white : CustomColors.darkRed,
                      func: () {
                        setState(() {
                          value = 4;
                          page = const ProfilePage();
                          header = "Profil";
                          visibility = true;
                        });
                        Timer(const Duration(seconds: 2), () {
                          setState(() {
                            visibility = false;
                          });
                        });
                      },
                      icon: Icons.account_circle_rounded,
                      shadowColor: value == 4
                          ? CustomColors.lightRed
                          : Colors.transparent,
                      visible: value == 4 ? true : false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: page,
    );
  }
}
