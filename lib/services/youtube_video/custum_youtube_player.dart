import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CustumYoutubePlayer extends StatefulWidget {
  const CustumYoutubePlayer({Key key, this.videoId}) : super(key: key);
  final String videoId;
  @override
  _CustumYoutubePlayerState createState() => _CustumYoutubePlayerState();
}

class _CustumYoutubePlayerState extends State<CustumYoutubePlayer> {
  YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
        initialVideoId: widget.videoId,
        params: const YoutubePlayerParams(
          loop: true,
          color: 'transparent',
          desktopMode: true,
          strictRelatedVideos: true,
          showFullscreenButton: !kIsWeb,
        ));
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: kIsWeb ? screenSize.height / 1.13 : screenSize.height / 3,
          width: screenSize.width,
          child: YoutubePlayerControllerProvider(
              controller: _controller,
              child: YoutubePlayerIFrame(
                controller: _controller,
              )),
        ),
      ],
    );
  }
}
