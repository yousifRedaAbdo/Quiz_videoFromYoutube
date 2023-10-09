import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:taskk/videoScreen/widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class VideoPlayerScreen extends StatefulWidget {
  final dynamic videoId;

  const VideoPlayerScreen({required this.videoId});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        disableDragSeek: true,
        enableCaption: false,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (Platform.isAndroid) {
        await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
      }
    }
    );
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Video Player")),
        ),
        body: Container(
          child: Stack(
            children: [
              YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: _controller,
                ),
                builder: (context, player)
                {
                     return player;
                },
              ),
                  const WaterMarkWidget(
                  text: "water mark text",
               ),
            ]
          ),
        )

      );

    }

    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }
  }