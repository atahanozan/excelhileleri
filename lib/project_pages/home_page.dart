import 'package:excel_hileleri_mobil/core/appbar_page.dart';
import 'package:excel_hileleri_mobil/core/color_contrast.dart';
import 'package:excel_hileleri_mobil/core/drawer_page.dart';
import 'package:excel_hileleri_mobil/core/mostlikeclass.dart';
import 'package:excel_hileleri_mobil/core/new_home.dart';
import 'package:excel_hileleri_mobil/core/topbar.dart';
import 'package:excel_hileleri_mobil/project_pages/googleads2.dart';
import 'package:excel_hileleri_mobil/project_pages/trainin_documents.dart';
import 'package:excel_hileleri_mobil/project_pages/translate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarPage(
        textappbar: "Excel Hileleri",
      ),
      drawer: const DrawerPage(),
      body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Center(
            child: ListView(
              children: [
                const GoogleAdsDenemeSon(),
                const TopBar(),
                const _robotButton(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      const TextColorContrast(
                          textone: "En Sevilen Dersler", size: 40),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: MostLikeClass(),
                      ),
                      const GoogleAdsDenemeSon(),
                      const _robotButtonBottom(),
                      Image.asset("assets/ders1.png"),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          "Blog Yazıları",
                          style: GoogleFonts.raleway(
                              fontSize: 40,
                              color: Colors.amber.shade700,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const GoogleAdsDenemeSon(),
                      const NewsPage(),
                      Image.asset("assets/yellowoffice.png"),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class _robotButtonBottom extends StatelessWidget {
  const _robotButtonBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Center(
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Image.asset("assets/robot2.gif"),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TrainingDocuments()));
                  },
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              "EXCEL EĞİTİMLERİNİN \nDEVAMI İÇİN \nTIKLAYINIZ...",
                              style: GoogleFonts.raleway(
                                  fontSize: 20,
                                  shadows: <Shadow>[
                                    const Shadow(
                                        offset: Offset(1, 1),
                                        blurRadius: 3.0,
                                        color: Colors.black54)
                                  ]),
                            ),
                          ),
                        ),
                        const Expanded(flex: 1, child: Text(""))
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class _robotButton extends StatelessWidget {
  const _robotButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Center(
        child: Stack(
          alignment: AlignmentDirectional.centerEnd,
          children: [
            Image.asset("assets/robot.gif"),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TranslatePage()));
                  },
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: Row(
                      children: [
                        const Expanded(flex: 1, child: Text("")),
                        Expanded(
                          flex: 1,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              "EXCEL FORMÜLLERİNİN \nTÜRKÇE VE İNGİLİZCE \nÇEVİRİLERİ İÇİN \nTIKLAYINIZ...",
                              style: GoogleFonts.raleway(
                                  fontSize: 20,
                                  shadows: <Shadow>[
                                    const Shadow(
                                        offset: Offset(1, 1),
                                        blurRadius: 3.0,
                                        color: Colors.black54)
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
