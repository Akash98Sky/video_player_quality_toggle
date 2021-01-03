import "items.dart";

class Response {
  final String baseUrl;
  final String detailsApiBase;
  final List<Items> items;

  const Response({
    this.baseUrl,
    this.detailsApiBase,
    this.items,
  });

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      baseUrl: json['base_url'],
      detailsApiBase: json['details_api_base'],
      items: json['items'] != null
          ? (json['items'] as List).map((e) => Items.fromJson(e)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['base_url'] = baseUrl;
    data['details_api_base'] = detailsApiBase;
    if (items != null) {
      data['items'] = items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
