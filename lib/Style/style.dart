import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Style{
  Style._();

  // ------------------ Colors -----------------//

  static const whiteColor = Color(0xffFFFFFF);
  static const blackColor = Color(0xff000000);
  static const primaryColor = Color(0xff009867);
  static const shimmerColor = Color(0x3348319D);
  static const shimmerBaseColor = Color(0x80FFFFFF);
  static const shimmerHighlightColor = Color(0x33FFFFFF);
  static const tabBarColor = Color(0xffEFEFEF);
  static const tabBarColorDark = Color(0xff17172B);
  static const textLightColor = Color(0xff24243D);

  // ------------------ Gradient -----------------//
  static const primaryGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xff1EAFD7),
        Color(0xff1ED761),
      ]);

  static textStyleNormal({
    double size = 16,
    Color textColor = primaryColor,
  }) {
    return GoogleFonts.workSans(
      fontSize: size,
      color: textColor,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none,
    );
  }

  static textStyleSemiBold({
    double size = 16,
    Color textColor = primaryColor,
  }) {
    return GoogleFonts.workSans(
      fontSize: size,
      color: textColor,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none,
    );
  }

  static textStyleBold({
    double size = 18,
    Color textColor = primaryColor,
  }) {
    return GoogleFonts.workSans(
      fontSize: size,
      color: textColor,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none,
    );
  }

  static textStyleRegular({
    double size = 16,
    Color textColor = primaryColor,
  }) {
    return GoogleFonts.workSans(
      fontSize: size,
      color: textColor,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none,
    );
  }

  static textStyleThin({
    double size = 16,
    Color textColor = primaryColor,
  }) {
    return GoogleFonts.workSans(
      fontSize: size,
      color: textColor,
      fontWeight: FontWeight.w300,
      decoration: TextDecoration.none,
    );
  }


}