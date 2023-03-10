import 'dart:convert';

List<ListArticlesModel> listArticlesModelFromJson(String str) =>
    List<ListArticlesModel>.from(json.decode(str).map((x) => ListArticlesModel.fromJson(x)));

String listArticlesModelToJson(List<ListArticlesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListArticlesModel {
  ListArticlesModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory ListArticlesModel.fromJson(Map<String, dynamic> json) => ListArticlesModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
