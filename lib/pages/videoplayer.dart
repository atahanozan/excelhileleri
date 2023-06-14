// ignore_for_file: unused_field

import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:excel_hileleri_mobil/ui/widgets/customappbar.dart';
import 'package:excel_hileleri_mobil/ui/widgets/socialmedia.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({
    Key? key,
    required this.title,
    required this.url,
    required this.content,
  }) : super(key: key);

  final String title;
  final String url;
  final String content;

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late YoutubePlayerController _controller;
  late PlayerState _playerState;
  late YoutubeMetaData _metaData;
  late YoutubePlayer player;
  String url = "";

  void listener() {
    setState(() {
      _playerState = _controller.value.playerState;
      _metaData = _controller.metadata;
    });
  }

  @override
  void initState() {
    setState(() {
      url = widget.url;
      _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url).toString(),
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
      player = YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        progressColors: const ProgressBarColors(
          playedColor: Colors.blue,
          handleColor: Colors.yellow,
        ),
        onReady: () {
          _controller.addListener(listener);
        },
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: player,
      builder: (context, player) => Scaffold(
        appBar: CustomAppBar(title: widget.title),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                player,
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.content,
                  style: CustomTextStyle.bodyText,
                ),
                const SizedBox(
                  height: 20,
                ),
                const SocialMeadiaChannels(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
