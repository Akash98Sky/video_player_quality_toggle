import 'package:anim_video_player/player/anim_video_player.dart';
import 'package:anim_video_player/settings/video_settings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: AnimVideoPlayer(
        settings: VideoSettings(
          qualities: [
            VideoQuality(
              '240P',
              'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
            ),
            VideoQuality(
              '480P',
              'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4',
            ),
          ],
          defaultQuality: '480P',
        ),
      ),
    );
  }
}
