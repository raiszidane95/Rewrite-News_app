import 'dart:convert';

DetailArticlesModel detailArticlesModelFromJson(String str) =>
    DetailArticlesModel.fromJson(json.decode(str));

String detailArticlesModelToJson(DetailArticlesModel data) => json.encode(data.toJson());

class DetailArticlesModel {
  DetailArticlesModel({
    this.id,
    this.userId,
    this.title,
    this.body,
  });

  int? id;
  int? userId;
  String? title;
  String? body;

  factory DetailArticlesModel.fromJson(Map<String, dynamic> json) => DetailArticlesModel(
        id: json["id"],
        userId: json["userId"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "title": title,
        "body": body,
      };
}
