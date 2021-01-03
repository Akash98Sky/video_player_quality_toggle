import 'package:anim_video_player/player/anim_video_controls.dart';
import 'package:anim_video_player/settings/video_settings.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AnimVideoPlayer extends StatefulWidget {
  final VideoSettings settings;

  AnimVideoPlayer({Key key, @required this.settings}) : super(key: key);

  @override
  _AnimVideoPlayerState createState() => _AnimVideoPlayerState();
}

class _AnimVideoPlayerState extends State<AnimVideoPlayer> {
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;
  String videoQuality;

  @override
  void initState() {
    super.initState();
    videoQuality = widget.settings.defaultQuality.quality;
    videoPlayerController =
        VideoPlayerController.network(widget.settings.defaultQuality.url);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      autoInitialize: true,
      customControls: AnimVideoControls(
        videoSettings: widget.settings,
        changeQuality: doChangeQuality,
      ),
    );
  }

  void doChangeQuality(String quality) {
    final video = widget.settings.setVideoQuality(quality);

    if (video.quality != videoQuality) {
      final oldControllers = [videoPlayerController, chewieController];

      setState(() {
        videoQuality = video.quality;
        videoPlayerController = VideoPlayerController.network(video.url);
        chewieController = ChewieController(
          videoPlayerController: videoPlayerController,
          autoPlay: true,
          autoInitialize: true,
          customControls: AnimVideoControls(
            videoSettings: widget.settings,
            changeQuality: doChangeQuality,
          ),
        );
      });

      Future.delayed(
        Duration(seconds: 1),
        () => oldControllers.forEach((element) => element.dispose()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Chewie(
        controller: chewieController,
      ),
    );
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    chewieController?.dispose();
    super.dispose();
  }
}
