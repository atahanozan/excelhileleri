import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_hileleri_mobil/pages/mainpage.dart';
import 'package:excel_hileleri_mobil/pages/mytrainings.dart';
import 'package:excel_hileleri_mobil/pages/notifications.dart';
import 'package:excel_hileleri_mobil/pages/profile.dart';
import 'package:excel_hileleri_mobil/services/firebase_messaging.dart';
import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
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
  final User? user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? uid;
  int totalDers = 0;
  Map<String, dynamic>? datas = {};
  Map<String, dynamic>? trainingDatas = {};

  @override
  void initState() {
    setState(() {
      uid = user?.uid;
      _service.connectNotification(context, uid.toString());
      _firestore
          .collection("Users")
          .doc(uid)
          .get()
          .then((DocumentSnapshot<Map<String, dynamic>> snapshot) {
        setState(() {
          datas = snapshot.data();
          _firestore
              .collection("BookTrainings")
              .where("no", isEqualTo: (snapshot['level'] + 1))
              .get()
              .then((QuerySnapshot<Map<String, dynamic>> snapshot) {
            for (var trainings in snapshot.docs) {
              setState(() {
                trainingDatas = trainings.data();
                _firestore
                    .collection("BookTrainings")
                    .get()
                    .then((QuerySnapshot snapshot) {
                  setState(() {
                    totalDers = snapshot.docs.length;
                  });
                });
              });
            }
          });
        });
      });
    });
    super.initState();
  }

  Widget page = const MainPage();
  int value = 1;

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
                      color: value == 1
                          ? CustomColors.darkRed
                          : CustomColors.lightRed,
                      func: () {
                        setState(() {
                          value = 1;
                          page = const MainPage();
                        });
                      },
                      icon:
                          value == 1 ? Icons.home_rounded : Icons.home_outlined,
                      shadowColor: value == 1
                          ? CustomColors.lightRed
                          : Colors.transparent,
                      visible: value == 1 ? true : false,
                      name: '${trainingDatas?['title']}',
                    ),
                    BottomNavBarButton(
                      color: value == 2
                          ? CustomColors.darkRed
                          : CustomColors.lightRed,
                      func: () {
                        setState(() {
                          value = 2;
                          page = MyTrainingsPage(
                            user: user,
                            level: datas!['level'],
                          );
                        });
                      },
                      icon:
                          value == 2 ? Icons.book_rounded : Icons.book_outlined,
                      shadowColor: value == 2
                          ? CustomColors.lightRed
                          : Colors.transparent,
                      visible: value == 2 ? true : false,
                      name: 'Eğitimlerim',
                    ),
                    BottomNavBarButton(
                      color: value == 3
                          ? CustomColors.darkRed
                          : CustomColors.lightRed,
                      func: () {
                        setState(() {
                          value = 3;
                          page = const NotificationsPage();
                        });
                      },
                      icon: value == 3
                          ? Icons.notifications_rounded
                          : Icons.notifications_outlined,
                      shadowColor: value == 3
                          ? CustomColors.lightRed
                          : Colors.transparent,
                      visible: value == 3 ? true : false,
                      name: 'Bildirimler',
                    ),
                    BottomNavBarButton(
                      color: value == 4
                          ? CustomColors.darkRed
                          : CustomColors.lightRed,
                      func: () {
                        setState(() {
                          value = 4;
                          page = ProfilePage(
                            user: user,
                            birth: datas?['birth'],
                            currenttraining: trainingDatas?['title'],
                            email: datas?['email'],
                            gender: datas?['gender'],
                            level: datas?['level'],
                            name: datas?['name'],
                            phone: datas?['phone'],
                            points: datas?['points'],
                            totalDers: totalDers,
                            traininglevel: 'Temel Seviye',
                          );
                        });
                      },
                      icon: value == 4
                          ? Icons.account_circle_rounded
                          : Icons.account_circle_outlined,
                      shadowColor: value == 4
                          ? CustomColors.lightRed
                          : Colors.transparent,
                      visible: value == 4 ? true : false,
                      name: 'Profil',
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
