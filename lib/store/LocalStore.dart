import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:translate/model/TranslateModel.dart';

abstract class LocalStore{
  LocalStore._();

//------------------ - Theme - ---------------//
  static setTheme(bool isLight) async {
    SharedPreferences store = await SharedPreferences.getInstance();
    store.setBool("theme", isLight);
  }

  static Future<bool> getTheme() async {
    SharedPreferences store = await SharedPreferences.getInstance();
    return store.getBool("theme") ?? true;
  }


  //------------------ - Favourites - ---------------//
  static Future<List<TranslateModel>> getFavourites() async {
    SharedPreferences store = await SharedPreferences.getInstance();
    List<String> list = store.getStringList("favourites") ?? [];
    List<TranslateModel> lostOfFavourites = [];
    for (var element in list) {
      lostOfFavourites.add(TranslateModel.fromJson(jsonDecode(element)));
    }
    return lostOfFavourites;
  }

  static setFavourites(TranslateModel model) async {
    SharedPreferences store = await SharedPreferences.getInstance();
    List<String> list = store.getStringList("favourites") ?? [];
    String todoJson = jsonEncode(model.toJson());
    list.add(todoJson);
    store.setStringList("favourites", list);
  }

  static removeFavourites(int index) async {
    SharedPreferences store = await SharedPreferences.getInstance();
    List<String> list  = store.getStringList("favourites") ?? [];
    list.removeAt(index);
    store.setStringList("favourites", list);
  }

  static Future<bool> removeAllFavourites() async {
    SharedPreferences store = await SharedPreferences.getInstance();
    return store.remove("favourites");
  }

  //------------------ - Clear AllData - ---------------//


  static Future<bool> clearAllData() async {
    SharedPreferences store = await SharedPreferences.getInstance();
    return store.clear();
  }


//------------------ - History - ---------------//

  static Future<List<TranslateModel>> getHistory() async {
    SharedPreferences store = await SharedPreferences.getInstance();
    List<String> list = store.getStringList("history") ?? [];
    List<TranslateModel> lostOfHistory = [];
    for (var element in list) {
      lostOfHistory.add(TranslateModel.fromJson(jsonDecode(element)));
    }
    return lostOfHistory;
  }

  static setHistory(TranslateModel model) async {
    SharedPreferences store = await SharedPreferences.getInstance();
    List<String> list = store.getStringList("history") ?? [];
    String todoJson = jsonEncode(model.toJson());
    list.add(todoJson);
    store.setStringList("history", list);
  }

  static removeHistory(int index) async {
    SharedPreferences store = await SharedPreferences.getInstance();
    List<String> list  = store.getStringList("history") ?? [];
    list.removeAt(index);
    store.setStringList("history", list);
  }

  static Future<bool> removeAllHistory() async {
    SharedPreferences store = await SharedPreferences.getInstance();
    return store.remove("history");
  }


}