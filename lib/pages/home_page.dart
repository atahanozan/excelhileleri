import 'package:excel_hileleri_mobil/pages/mainpage.dart';
import 'package:excel_hileleri_mobil/pages/notifications.dart';
import 'package:excel_hileleri_mobil/pages/profile.dart';
import 'package:excel_hileleri_mobil/ui/widgets/appbar_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget page = const MainPage();
  int value = 1;
  Color iconColor = const Color(0xffFF763D);
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
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
                color: const Color(0xffFFF8E1),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 10,
                  )
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: value == 1
                        ? const Color(0xffFFCDD2)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            page = const MainPage();
                            value = 1;
                          });
                        },
                        icon: Icon(
                          Icons.home_rounded,
                          color: value == 1
                              ? const Color(0xffF92809)
                              : const Color(0xffFF763D),
                          size: 35,
                        ),
                      ),
                      Visibility(
                        visible: value == 1 ? true : false,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Text(
                            "Ana Sayfa",
                            style: GoogleFonts.raleway(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: value == 2
                        ? const Color(0xffFFCDD2)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            page = const NotificationsPage();
                            value = 2;
                          });
                        },
                        icon: Icon(
                          Icons.notifications_rounded,
                          color: value == 2
                              ? const Color(0xffF92809)
                              : const Color(0xffFF763D),
                          size: 35,
                        ),
                      ),
                      Visibility(
                        visible: value == 2 ? true : false,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Text(
                            "Bildirim",
                            style: GoogleFonts.raleway(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: value == 3
                        ? const Color(0xffFFCDD2)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            page = const ProfilePage();
                            value = 3;
                          });
                        },
                        icon: Icon(
                          Icons.account_circle_rounded,
                          color: value == 3
                              ? const Color(0xffF92809)
                              : const Color(0xffFF763D),
                          size: 35,
                        ),
                      ),
                      Visibility(
                        visible: value == 3 ? true : false,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Text(
                            "Profil",
                            style: GoogleFonts.raleway(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: page,
    );
  }
}
