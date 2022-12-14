import 'dart:convert';

LangModel langModelFromMap(String str) => LangModel.fromMap(json.decode(str));

String langModelToMap(LangModel data) => json.encode(data.toMap());

class LangModel {
  LangModel({
    required this.id,
    required this.lang,
  });

  final int id;
  final String lang;

  factory LangModel.fromMap(Map<String, dynamic> json) => LangModel(
        id: json["id"],
        lang: json["lang"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "lang": lang,
      };

  static String storeCollection = "lang";
}
