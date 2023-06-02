import 'package:excel_hileleri_mobil/ui/widgets/appbar_page.dart';
import 'package:excel_hileleri_mobil/ui/widgets/socialmedia.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HucreBirlestirmeVidClass extends StatefulWidget {
  const HucreBirlestirmeVidClass({Key? key}) : super(key: key);

  @override
  State<HucreBirlestirmeVidClass> createState() =>
      _HucreBirlestirmeVidClassState();
}

class _HucreBirlestirmeVidClassState extends State<HucreBirlestirmeVidClass> {
  final videoURL = "https://www.youtube.com/watch?v=SFRAIjXfGus";
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);

    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(autoPlay: false),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarPage(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                onReady: () => debugPrint("Ready"),
                bottomActions: [
                  CurrentPosition(),
                  ProgressBar(
                    isExpanded: true,
                    colors: const ProgressBarColors(
                        playedColor: Colors.purple, handleColor: Colors.yellow),
                  ),
                  const PlaybackSpeedButton(),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  "HÜCRE BİRLEŞTİRME VİDEOLU ANLATIM",
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    """
  Bu videoda tablolarınızı daha kullanışlı ve okunaklı hale getirebilecek Hücre Birleştirme kullanımı detaylıca anlatılmaktadır. 

  Hücre birleştirme genel olarak formül yerleştirdiğimiz özet sayfalarında kullanılmalı, ham data sayfalarında çoğunlukla kullanılmamalıdır.

  Hücre birleştirme işleminden sonra satırları sıralamada ya da sütunla işlem yapılan formüllerde sorun çıkardığından hamdata sayfasında hücre birleştirme işleminden kaçınmalıyız.
                    """,
                    style: GoogleFonts.raleway(),
                  )),
              SocialMeadiaChannels()
            ],
          ),
        ),
      ),
    );
  }
}
