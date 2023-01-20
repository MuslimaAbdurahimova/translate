// To parse this JSON data, do
//
//     final languagesModel = languagesModelFromJson(jsonString);

import 'dart:convert';

LanguagesModel? languagesModelFromJson(String str) => LanguagesModel.fromJson(json.decode(str));

String languagesModelToJson(LanguagesModel? data) => json.encode(data!.toJson());

class LanguagesModel {
  LanguagesModel({
    this.data,
  });

  Data? data;

  factory LanguagesModel.fromJson(Map<String, dynamic> json) => LanguagesModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.languages,
  });

  List<Language?>? languages;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    languages: json["languages"] == null ? [] : List<Language?>.from(json["languages"]!.map((x) => Language.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "languages": languages == null ? [] : List<dynamic>.from(languages!.map((x) => x!.toJson())),
  };
}

class Language {
  Language({
    this.code,
    this.name,
  });

  String? code;
  String? name;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
    code: json["code"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
  };
}
