import 'dart:convert';

import 'package:anim_video_player/models/json_res.dart';
import 'package:anim_video_player/player/anim_video_player.dart';
import 'package:anim_video_player/settings/video_settings.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

Future<JsonRes> fetchJson() async {
  final res = await http
      .get('https://gogo-api-cdn.herokuapp.com/details/death-note/ep/1/');

  return JsonRes.fromJson(json.decode(res.body));
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
      body: FutureBuilder<JsonRes>(
          future: fetchJson(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data.code);
              return AnimVideoPlayer(
                settings: VideoSettings(
                  qualities: snapshot.data.response.items
                      .map((e) => VideoQuality(
                          e.quality, Uri.tryParse(e.url).toString()))
                      .toList(growable: false),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
