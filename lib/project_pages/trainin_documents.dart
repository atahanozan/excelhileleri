import 'package:excel_hileleri_mobil/classes_part1/class1.dart';
import 'package:excel_hileleri_mobil/classes_part1/class10.dart';
import 'package:excel_hileleri_mobil/classes_part1/class11.dart';
import 'package:excel_hileleri_mobil/classes_part1/class12.dart';
import 'package:excel_hileleri_mobil/classes_part1/class13.dart';
import 'package:excel_hileleri_mobil/classes_part1/class14.dart';
import 'package:excel_hileleri_mobil/classes_part1/class15.dart';
import 'package:excel_hileleri_mobil/classes_part1/class16.dart';
import 'package:excel_hileleri_mobil/classes_part1/class17.dart';
import 'package:excel_hileleri_mobil/classes_part1/class18.dart';
import 'package:excel_hileleri_mobil/classes_part1/class19.dart';
import 'package:excel_hileleri_mobil/classes_part1/class2.dart';
import 'package:excel_hileleri_mobil/classes_part1/class3.dart';
import 'package:excel_hileleri_mobil/classes_part1/class4.dart';
import 'package:excel_hileleri_mobil/classes_part1/class5.dart';
import 'package:excel_hileleri_mobil/classes_part1/class6.dart';
import 'package:excel_hileleri_mobil/classes_part1/class7.dart';
import 'package:excel_hileleri_mobil/classes_part1/class8.dart';
import 'package:excel_hileleri_mobil/classes_part1/class9.dart';
import 'package:excel_hileleri_mobil/project_pages/googleads2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/appbar_page.dart';

class TrainingDocuments extends StatefulWidget {
  const TrainingDocuments({Key? key}) : super(key: key);

  @override
  State<TrainingDocuments> createState() => _TrainingDocumentsState();
}

class _TrainingDocumentsState extends State<TrainingDocuments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarPage(
        textappbar: "",
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: [
              const GoogleAdsDenemeSon(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "BAŞLANGIÇ SEVİYE YAZILI DERS İÇERİKLERİ",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.raleway(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.purple.shade800),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    child: _videoDetail(
                      text1: 'GİRİŞ',
                      page: ClassOnePage(),
                    ),
                  ),
                  const Expanded(
                    child: _videoDetail(
                      text1: 'MS-EXCEL’i BAŞLATMA - ÇIKIŞ',
                      page: ClassTwoPage(),
                    ),
                  ),
                  const Expanded(
                    child: _videoDetail(
                      text1: 'EXCEL’İN GENEL YAPISI',
                      page: ClassThreePage(),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    child: _videoDetail(
                      text1: 'BİR İLETİŞİM KUTUSUNU KULLANMAK',
                      page: ClassFourPage(),
                    ),
                  ),
                  const Expanded(
                    child: _videoDetail(
                      text1: 'ÇALIŞMA SAYFASINDA KLAVYE İLE HAREKET',
                      page: ClassFivePage(),
                    ),
                  ),
                  const Expanded(
                    child: _videoDetail(
                      text1: 'HÜCRELERE VERİ GİRMEK',
                      page: ClassSixPage(),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    child: _videoDetail(
                      text1: 'HÜCRELERE GİRİLECEK VERİ TÜRLERİ',
                      page: ClassSevenPage(),
                    ),
                  ),
                  const Expanded(
                    child: _videoDetail(
                      text1: 'VERİLER ÜZERİNDE ÇALIŞMAK',
                      page: ClassEightPage(),
                    ),
                  ),
                  const Expanded(
                    child: _videoDetail(
                      text1: 'SEÇME İŞLEMLERİ',
                      page: ClassNinePage(),
                    ),
                  ),
                ],
              ),
              const GoogleAdsDenemeSon(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    child: _videoDetail(
                      text1: 'EXCEL İLE ÇALIŞMAKİ',
                      page: ClassTenPage(),
                    ),
                  ),
                  const Expanded(
                    child: _videoDetail(
                      text1: 'BİÇİMLENDİRME',
                      page: ClassElevenPage(),
                    ),
                  ),
                  const Expanded(
                    child: _videoDetail(
                      text1: 'SÜTUN GENİŞLİKLERİ VE SATIR YÜKSEKLİKLERİ',
                      page: ClassTwelvePage(),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    child: _videoDetail(
                      text1: 'SATIR/SÜTUN EKLEME/ÇIKARMA',
                      page: ClassThirteenPage(),
                    ),
                  ),
                  const Expanded(
                    child: _videoDetail(
                      text1: 'ÇALIŞMA SAYFALARIYLA İLGİLİ İŞLEMLER',
                      page: ClassFourteenPage(),
                    ),
                  ),
                  const Expanded(
                    child: _videoDetail(
                      text1: 'HÜCRELERDEKİ VERİLERİ TAŞIMAK',
                      page: ClassFifteenPage(),
                    ),
                  ),
                ],
              ),
              const GoogleAdsDenemeSon(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    child: _videoDetail(
                      text1: 'HÜCRELERDEKİ VERİLERİ KOPYALAMAK',
                      page: ClassSixteenPage(),
                    ),
                  ),
                  const Expanded(
                    child: _videoDetail(
                      text1: 'VERİ LİSTELERİ İLE İLGİLİ İŞLEMLER',
                      page: ClassSeventeenPage(),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    child: _videoDetail(
                      text1: 'GRAFİKLER',
                      page: ClassEighteenPage(),
                    ),
                  ),
                  const Expanded(
                    child: _videoDetail(
                      text1:
                          'ÇALIŞMAYA RESİM, ŞEKİL, GRAFİK GİBİ NESNELERİ EKLEME',
                      page: ClassNineteenPage(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class _videoDetail extends StatelessWidget {
  const _videoDetail({Key? key, required this.text1, this.page})
      : super(key: key);
  final String text1;
  final page;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Card(
        child: Column(
          children: [
            Image.asset("assets/yellowclass.png"),
            Text(
              text1,
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w600, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "Yazılı Ders...",
                style: GoogleFonts.raleway(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
