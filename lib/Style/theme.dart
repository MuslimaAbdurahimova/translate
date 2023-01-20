import 'package:flutter/material.dart';
import 'package:translate/Style/style.dart';

abstract class ThemeStyle {
  ThemeStyle._();

  static ThemeData? lightTheme = ThemeData(
      primaryColor: const Color(0xffFCFCFC),
      hintColor: const Color(0xffFCFCFC),
      primaryColorDark: const Color(0xff151515),
      cardColor: Color(0xffB5B5B5),

      textTheme: TextTheme(
        headline1: Style.textStyleBold(textColor: Style.textLightColor),
        headline2: Style.textStyleSemiBold(textColor: Style.textLightColor),
        headline3: Style.textStyleNormal(textColor: Style.textLightColor),
        headline4: Style.textStyleRegular(textColor: Style.textLightColor),
        headline5: Style.textStyleThin(textColor: Style.textLightColor),
      ));


  static ThemeData? darkTheme = ThemeData(
      secondaryHeaderColor: Style.whiteColor,
      hintColor: const Color(0xff272732),
      primaryColorDark: const Color(0xff5F6172),
      primaryColor: const Color(0xff1D1D27),
      cardColor: Color(0xff5F6172),
      appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff24243D),
          iconTheme: IconThemeData(
            color: Style.whiteColor,
          )
      ),
      textTheme: TextTheme(
        headline1: Style.textStyleBold(textColor: Style.whiteColor),
        headline2: Style.textStyleSemiBold(textColor: Style.whiteColor),
        headline3: Style.textStyleNormal(textColor: Style.whiteColor),
        headline4: Style.textStyleRegular(textColor: Style.whiteColor),
        headline5: Style.textStyleThin(textColor: Style.whiteColor),
      ));
}