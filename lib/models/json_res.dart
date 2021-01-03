import "response.dart";

class JsonRes {
  final int code;
  final String msg;
  final Response response;
  final String status;

  const JsonRes({
    this.code,
    this.msg,
    this.response,
    this.status,
  });

  factory JsonRes.fromJson(Map<String, dynamic> json) {
    return JsonRes(
      code: json['code'],
      msg: json['msg'],
      response:
          json['response'] != null ? Response.fromJson(json['response']) : null,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = code;
    data['msg'] = msg;
    if (response != null) {
      data['response'] = response.toJson();
    }
    data['status'] = status;
    return data;
  }
}
