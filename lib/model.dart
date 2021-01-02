import 'dart:convert';

List<ModelUser> modelModelUserFromJson(String str) =>
    List<ModelUser>.from(json.decode(str).map((x) => ModelUser.fromJson(x)));
String modelModelUserToJson(List<ModelUser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelUser {
  String userid;
  int id;
  String title;
  String body;

  ModelUser({this.userid, this.id, this.title, this.body});

  factory ModelUser.fromJson(Map<String, dynamic> json) => ModelUser(
        userid: json["userid"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );
  Map<String, dynamic> toJson() => {
        "userid": userid,
        "id": id,
        "title": title,
        "body": body,
      };
}
