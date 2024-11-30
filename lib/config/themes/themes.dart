import 'package:flutter/material.dart';
import 'package:town_square/config/themes/text_styles.dart';

const Color primary600 = Color(0XFF35BAF8);
const Color primary200 = Color(0XFFC1EBFF);

const Color neutralWhite = Color(0XFFE9ECEF);
const Color neutralBlack = Color(0XFF000000);
const Color neutralBlackShadow = Color.fromRGBO(0, 0, 0, 0.12);
const Color neutral100 = Color(0XFFF8F9FA);
const Color neutral200 = Color(0XFFE9ECEF);
const Color neutral300 = Color(0XFFDEE2E6);
const Color neutral500 = Color(0XFFADB5BD);
const Color neutral600 = Color(0XFF6C757D);

const Color yellowSecondary200 = Color(0XFFFBF2C0);
const Color yellowSecondary300 = Color(0XFFFFF09C);
const Color purpleSecondary200 = Color(0XFFEEE1F5);
const Color purpleSecondary400 = Color(0XFFBAA1C8);

const Color lightIntensity = Color(0XFFD5F1FF);
const Color mediumIntensity = Color(0XFFF3E8FF);
const Color highIntensity = Color(0XFFFFEAD1);

const Color lightIntensityTitle = Color(0XFF65B5DB);
const Color mediumIntensityTitle = Color(0XFFC9A4F2);
const Color highIntensityTitle = Color(0XFFDC974F);

const Color childcareTag = Color(0XFFD8F7DF);
const Color childcareTagTitle = Color(0XFF8AB58A);

ThemeData getDarkTheme(bool isDesktop) {
  return ThemeData(
    fontFamily: "SFProDisplay",
    brightness: Brightness.dark,
    scaffoldBackgroundColor: neutralBlack,
    textTheme: TextTheme(
      headlineLarge: isDesktop
          ? desktopHeading1.copyWith(color: Colors.white)
          : mobileHeading1.copyWith(color: Colors.white),
      titleLarge: isDesktop
          ? desktopSubtitle1.copyWith(color: Colors.white)
          : mobileSubtitle2.copyWith(color: Colors.white),
      bodyLarge: desktopBody1,
      bodyMedium: mobileBody2,
    ),
  );
}

ThemeData getLightTheme(bool isDesktop) {
  return ThemeData(
    fontFamily: "SFProDisplay",
    brightness: Brightness.dark,
    scaffoldBackgroundColor: neutral100,
    textTheme: TextTheme(
      headlineLarge: isDesktop
          ? desktopHeading1.copyWith(color: Colors.black)
          : mobileHeading1.copyWith(color: Colors.black),
      titleLarge: isDesktop
          ? desktopSubtitle1.copyWith(color: Colors.black)
          : mobileSubtitle2.copyWith(color: Colors.black),
      bodyLarge: desktopBody1.copyWith(color: Colors.black),
      bodyMedium: mobileBody2.copyWith(color: Colors.black),
    ),
  );
}
