import 'package:flutter/material.dart';
import 'package:translate/pages/GeneralPage.dart';
import 'package:translate/pages/OnBoarding/SplashScreen.dart';
import 'package:translate/store/LocalStore.dart';

import 'Style/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  // ignore: library_private_types_in_public_api
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  bool isChangeTheme = false;
  bool isLoading = true;

  getTheme() async {
    isLoading = true;
    setState(() {});
    isChangeTheme = await LocalStore.getTheme();
    isLoading = false;
    setState(() {});
  }

  Future<void> change() async {
    isChangeTheme = !isChangeTheme;
    setState(() {});
  }

  @override
  void initState() {
    getTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Center(child: CircularProgressIndicator()))
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: isChangeTheme ? ThemeMode.dark : ThemeMode.light,
            theme: ThemeStyle.lightTheme!,
            darkTheme: ThemeStyle.darkTheme!,
            title: 'Translate',
            home: SplashScreen(isActive: true,isChangeTheme: isChangeTheme,),
          );
  }
}
