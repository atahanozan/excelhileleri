import 'package:excel_hileleri_mobil/pages/home/chatwithteacher.dart';
import 'package:excel_hileleri_mobil/pages/home/competition.dart';
import 'package:excel_hileleri_mobil/pages/home/keyboardshortcuts.dart';
import 'package:excel_hileleri_mobil/pages/home/mostuseformules.dart';
import 'package:excel_hileleri_mobil/ui/widgets/socialmedia.dart';
import 'package:excel_hileleri_mobil/ui/helper/text_helper.dart';
import 'package:excel_hileleri_mobil/ui/widgets/adsappbar.dart';
import 'package:excel_hileleri_mobil/ui/widgets/blogs.dart';
import 'package:excel_hileleri_mobil/ui/widgets/classcards.dart';
import 'package:excel_hileleri_mobil/ui/widgets/homecards.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AdsAppBar(),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                  ),
                  child: Row(
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
                        page: const KeyboardShorcutsPage(),
                      )),
                    ],
                  ),
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
                        page: const ChatWithTeacherPage(),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffFFE7C6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        ClassCard(
                          header: 'Yazılı Dersler',
                          content: TextUtilities.yaziliDers,
                          image: 'assets/images/bookclass.png',
                        ),
                        const Divider(),
                        ClassCard(
                          header: 'Videolu Dersler',
                          content: TextUtilities.videoluDersler,
                          image: 'assets/images/videoclass.png',
                        ),
                      ],
                    ),
                  ),
                ),
                const BlogsPage(),
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
