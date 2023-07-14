import 'dart:async';

import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({
    Key? key,
    required this.url,
    required this.title,
    required this.body,
    required this.height,
    required this.width,
  }) : super(key: key);

  final String url;
  final String title;
  final String body;
  final double height;
  final double width;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool visibility = false;
  IconData videoIcon = Icons.pause;

  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((value) {
        setState(() {});
      });
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.play();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (_controller.value.isPlaying) {
          setState(() {
            _controller.pause();
            visibility = true;

            Timer(const Duration(milliseconds: 200), () {
              setState(() {
                visibility = false;
              });
            });
          });
        } else {
          setState(() {
            _controller.play();
            visibility = true;
            videoIcon = Icons.play_arrow;

            Timer(const Duration(milliseconds: 200), () {
              setState(() {
                visibility = false;
              });
            });
          });
        }
      },
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          SizedBox(
            height: widget.height,
            width: widget.width,
            child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller)),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.1, 0.9],
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.7),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.title,
                  style: CustomTextStyle.smallHeader,
                ),
                Text(
                  widget.body,
                  style: CustomTextStyle.bodyText,
                ),
              ],
            ),
          ),
          Visibility(
            visible: visibility,
            child: Container(
              height: widget.height,
              width: widget.width,
              alignment: Alignment.center,
              child: Icon(
                videoIcon,
                size: 70,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
