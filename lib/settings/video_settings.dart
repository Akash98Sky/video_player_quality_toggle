import 'package:flutter/foundation.dart';

class VideoQuality {
  final String quality;
  final String url;

  VideoQuality(this.quality, this.url);
}

class VideoSettings {
  final List<VideoQuality> qualities;
  final VideoQuality defaultQuality;
  VideoQuality _quality;

  VideoQuality get currentQuality => _quality ?? defaultQuality;

  VideoQuality setVideoQuality(String quality) =>
      _quality = qualities.firstWhere(
        (e) => e.quality == quality,
        orElse: () => defaultQuality,
      );

  VideoSettings({@required this.qualities, String defaultQuality})
      : assert(qualities?.isNotEmpty),
        this.defaultQuality = qualities.firstWhere(
          (e) => e.quality == defaultQuality,
          orElse: () => qualities.first,
        );
}
