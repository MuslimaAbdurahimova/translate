import 'dart:convert';

class TranslateModel {
  String? sourceLanguage;
  String? targetLanguage;
  String? text;
  String? response;

// ignore: non_constant_identifier_names
  TranslateModel(
      {required this.sourceLanguage,
      required this.targetLanguage,
      required this.text, this.response});

  factory TranslateModel.fromJson(Map data) {
    return TranslateModel(
      sourceLanguage: data['source_language'],
      targetLanguage: data['target_language'],
      text: data['text'],
      response: data['response'],
    );
  }

  Map<String, String?> toJson() => {
        'source_language': sourceLanguage,
        'target_language': targetLanguage,
        'text': text,
        'response':response,
      };
}
