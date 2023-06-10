import 'package:excel_hileleri_mobil/pages/home/chatwithteacher.dart';
import 'package:excel_hileleri_mobil/pages/home/competition.dart';
import 'package:excel_hileleri_mobil/pages/home/keyboardshortcuts.dart';
import 'package:excel_hileleri_mobil/pages/home/mostuseformules.dart';
import 'package:excel_hileleri_mobil/pages/mychatlist.dart';
import 'package:excel_hileleri_mobil/ui/widgets/homeaicard.dart';
import 'package:excel_hileleri_mobil/ui/widgets/socialmedia.dart';
import 'package:excel_hileleri_mobil/ui/helper/text_helper.dart';
import 'package:excel_hileleri_mobil/ui/widgets/adsappbar.dart';
import 'package:excel_hileleri_mobil/ui/widgets/blogs.dart';
import 'package:excel_hileleri_mobil/ui/widgets/classcards.dart';
import 'package:excel_hileleri_mobil/ui/widgets/homecards.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  String? email, name, uid;

  @override
  void initState() {
    setState(() {
      user = _auth.currentUser;
      email = user?.email;
      name = user?.displayName;
      uid = user?.uid;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AdsAppBar(),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, "/alltrainings"),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffFFE7C6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClassCard(
                      header: 'Eğitimlere Hemen Başla',
                      content: TextUtilities.yaziliDers,
                      image: 'assets/images/bookclass.png',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: BlogsPage(),
                ),
                const HomeAiCard(),
                const Divider(
                  thickness: 3,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                    bottom: 10,
                  ),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Kolay Menü",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.raleway(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: HomePageCards(
                      header: 'Sık Kullanılan\nFormüller',
                      content: TextUtilities.sikKullanilanFormuller,
                      image: 'assets/images/formulas.png',
                      page: MostUsedFormulas(),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: HomePageCards(
                      header: 'Klavye\nKısayolları',
                      content: TextUtilities.klavyeKisayollar,
                      image: 'assets/images/keyboard.png',
                      page: KeyboardShorcutsPage(),
                    )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: HomePageCards(
                        header: 'Bilgi\nYarışması',
                        content: TextUtilities.bilgiYarisma,
                        image: 'assets/images/competition.png',
                        page: const CompetitionPage(),
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: HomePageCards(
                        header: 'Eğitmene\nSor',
                        content: TextUtilities.egitmeneSor,
                        image: 'assets/images/chat.png',
                        page: email == "atahanozantokdemir@gmail.com"
                            ? const MyChatList()
                            : ChatWithTeacherPage(
                                email: email.toString(),
                                uid: uid.toString(),
                                name: name.toString(),
                                role: 'user',
                              ),
                      )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SocialMeadiaChannels(),
              ],
            ),
          )),
    );
  }
}
