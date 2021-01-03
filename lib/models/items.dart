class Items {
  final String quality;
  final String url;

  const Items({
    this.quality,
    this.url,
  });

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      quality: json['quality'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['quality'] = quality;
    data['url'] = url;
    return data;
  }
}
