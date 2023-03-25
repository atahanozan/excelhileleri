import 'package:excel_hileleri_mobil/core/appbar_page.dart';
import 'package:excel_hileleri_mobil/core/color_contrast.dart';
import 'package:excel_hileleri_mobil/core/socialmedia.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CokEgerSayVidClass extends StatefulWidget {
  const CokEgerSayVidClass({Key? key}) : super(key: key);

  @override
  State<CokEgerSayVidClass> createState() => _CokEgerSayVidClassState();
}

class _CokEgerSayVidClassState extends State<CokEgerSayVidClass> {
  final videoURL = "https://www.youtube.com/watch?v=TPaxGwoarNM&t=2s";
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
      appBar: AppbarPage(textappbar: ""),
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
                child: TextColorContrast(
                  textone: "ÇOK EĞER SAY FORMÜLÜ VİDEOLU ANLATIM",
                  size: 20,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    """
  Bu videoda Çokeğersay formülünün neden ve nasıl kullanıldığı ile ilgili detaylı anlatımlar yer almaktadır.
                    
  Çokeğersay formülü daha çok yapılan işlem adetlerini ya da bir datadaki veri sayısını belirli kurallara göre saymamızı sağlayan bir kısayol formülüdür.

  Gelin kısaca nasıl kullanıldığına hep beraber bakalım.
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
