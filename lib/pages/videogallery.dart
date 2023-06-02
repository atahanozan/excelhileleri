import 'package:excel_hileleri_mobil/classes_part1/youtube_class_1.dart';
import 'package:excel_hileleri_mobil/classes_part1/youtube_class_2.dart';
import 'package:excel_hileleri_mobil/classes_part1/youtube_class_3.dart';
import 'package:excel_hileleri_mobil/ui/widgets/appbar_page.dart';
import 'package:excel_hileleri_mobil/services/googleads2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoGallery extends StatefulWidget {
  const VideoGallery({super.key});

  @override
  State<VideoGallery> createState() => _VideoGalleryState();
}

class _VideoGalleryState extends State<VideoGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarPage(),
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
                  "VİDEOLU DERS İÇERİKLERİ",
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
                      text1: 'ÇOKEĞERSAY',
                      page: CokEgerSayVidClass(),
                    ),
                  ),
                  const Expanded(
                    child: _videoDetail(
                      text1: 'ÇOKETOPLA',
                      page: CokEtoplaVidClass(),
                    ),
                  ),
                  const Expanded(
                    child: _videoDetail(
                      text1: 'HÜCRE BİRLEŞTİRME',
                      page: HucreBirlestirmeVidClass(),
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
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/yellowclass.png"),
              Text(
                text1,
                style: GoogleFonts.raleway(
                    fontSize: 18, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "Videolu Ders...",
                  style: GoogleFonts.raleway(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
