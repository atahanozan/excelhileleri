import 'dart:math';

import 'package:excel_hileleri_mobil/pages/mainpage.dart';
import 'package:excel_hileleri_mobil/pages/trainings/mytrainings.dart';
import 'package:excel_hileleri_mobil/pages/notes.dart';
import 'package:excel_hileleri_mobil/pages/profile.dart';
import 'package:excel_hileleri_mobil/pages/shortvideo.dart';
import 'package:excel_hileleri_mobil/pages/yapayzeka.dart';
import 'package:excel_hileleri_mobil/services/trainingservice.dart';
import 'package:excel_hileleri_mobil/ui/helper/userinfohelper.dart';
import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/widgets/appbar_page.dart';
import 'package:excel_hileleri_mobil/ui/widgets/bottomnavbarbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late FirebaseMessaging messaging;
  String? uid, email;
  User? user;
  int level = 1;
  int coin = 0;
  int no = 1;
  int unit = 1;
  int pageNo = 1;
  String birth = "";
  String gender = "";
  String name = "";
  String phone = "";
  String statu = "";
  String desc = "";
  String title = "";
  String url = "";
  List<dynamic> points = [];
  int totalDers = 0;
  Widget page = Container();
  int value = 1;
  int pic = 1;

  void updateAllInfo() {
    setState(() {
      user = _auth.currentUser;
      uid = user?.uid;
      email = user?.email;
      UserInfoData().userbilgileri().then((value) {
        setState(() {
          name = value["name"];
          birth = value["birth"];
          gender = value["gender"];
          phone = value["phone"];
          statu = value["statu"];
          points = value["points"];
          level = value["level"];
          coin = value["coin"];
          TrainingService().bookInfo(level).then((value) {
            setState(() {
              no = value["no"];
              title = value["name"];
              desc = value["desc"];
            });
          });
        });
      });
      TrainingService().bookLenght().then((value) {
        setState(() {
          totalDers = value;
        });
      });
    });
  }

  @override
  void initState() {
    updateAllInfo();
    setState(() {
      pic = Random().nextInt(5) + 1;
      page = MainPage();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarPage(
        name: name,
        coin: coin,
      ),
      extendBodyBehindAppBar: value == 3 ? true : false,
      floatingActionButton: InkWell(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => const YapayZekaPage())),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/images/fab/askme.png"),
                ),
              ),
            ),
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/images/fab/$pic.gif"),
                ),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: BottomNavBarButton(
                          color: value == 1
                              ? CustomColors.darkRed
                              : CustomColors.lightRed,
                          func: () {
                            setState(() {
                              value = 1;
                              page = MainPage();
                            });
                          },
                          icon: value == 1
                              ? Icons.home_rounded
                              : Icons.home_outlined,
                          shadowColor: value == 1
                              ? CustomColors.lightRed
                              : Colors.transparent,
                          visible: value == 1 ? true : false,
                          name: "Ana Sayfa",
                        ),
                      ),
                      Expanded(
                        child: BottomNavBarButton(
                          color: value == 2
                              ? CustomColors.darkRed
                              : CustomColors.lightRed,
                          func: () {
                            setState(() {
                              value = 2;
                              page = MyTrainingsPage(
                                level: level,
                                points: points,
                                traininglevel: "traininglevel",
                                trainingname: title,
                              );
                            });
                          },
                          icon: value == 2
                              ? Icons.book_rounded
                              : Icons.book_outlined,
                          shadowColor: value == 2
                              ? CustomColors.lightRed
                              : Colors.transparent,
                          visible: value == 2 ? true : false,
                          name: 'Eğitimlerim',
                        ),
                      ),
                      const SizedBox(width: 60),
                      Expanded(
                        child: BottomNavBarButton(
                          color: value == 4
                              ? CustomColors.darkRed
                              : CustomColors.lightRed,
                          func: () {
                            setState(() {
                              value = 4;
                              page = const MyNotesPage();
                            });
                          },
                          icon: value == 4
                              ? Icons.style_rounded
                              : Icons.style_outlined,
                          shadowColor: value == 4
                              ? CustomColors.lightRed
                              : Colors.transparent,
                          visible: value == 4 ? true : false,
                          name: 'Notlarım',
                        ),
                      ),
                      Expanded(
                        child: BottomNavBarButton(
                          color: value == 5
                              ? CustomColors.darkRed
                              : CustomColors.lightRed,
                          func: () {
                            setState(() {
                              value = 5;
                              page = ProfilePage(
                                birth: birth,
                                currenttraining: title,
                                email: "$email",
                                gender: gender,
                                level: level,
                                name: name,
                                phone: phone,
                                points: points,
                                totalDers: totalDers,
                                traininglevel: 'Temel Seviye',
                              );
                            });
                          },
                          icon: value == 5
                              ? Icons.account_circle_rounded
                              : Icons.account_circle_outlined,
                          shadowColor: value == 5
                              ? CustomColors.lightRed
                              : Colors.transparent,
                          visible: value == 5 ? true : false,
                          name: 'Profil',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    value = 3;
                    page = const ShortVideosPage();
                  });
                },
                child: Container(
                  height: 60,
                  width: 60,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: CustomColors.darkRed,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    size: 40,
                    color: CustomColors.lightYellow,
                  ),
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
