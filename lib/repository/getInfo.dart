import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:translate/model/LanguagesModel.dart';
import 'package:translate/model/TranslateModel.dart';

class GetInfo {
  GetInfo._();

  static sendTranslate(TranslateModel model) async {
    try {
      final url =
          Uri.parse("https://text-translator2.p.rapidapi.com/translate");
      final res = await http.post(
        url,
        headers: {
          'content-type': 'application/x-www-form-urlencoded',
          'X-RapidAPI-Key':
              'bb1a6b8214mshb07418bf004d615p17e440jsn212b284977ff',
          'X-RapidAPI-Host': 'text-translator2.p.rapidapi.com'
        },
        body:
            "text=${model.text}!&target_language=${model.targetLanguage}&source_language=${model.sourceLanguage}",
      );
      return jsonDecode(res.body)['data']['translatedText'];
    } catch (e) {
      print(e);
    }
  }

  static Future<LanguagesModel?> getLanguages() async {
    try {
      final url =
          Uri.parse("https://text-translator2.p.rapidapi.com/getLanguages");
      final res = await http.get( url,  headers: {
          'X-RapidAPI-Key':
              'bb1a6b8214mshb07418bf004d615p17e440jsn212b284977ff',
          'X-RapidAPI-Host': 'text-translator2.p.rapidapi.com'
        },);
      return languagesModelFromJson(res.body);
    } catch (e) {
      print(e);
    }
  }
}
