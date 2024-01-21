import 'package:flutter/material.dart';

import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/text.dart';

ThemeData defaultTheme(BuildContext context, {String? type = 'light'}) {
  if (type != 'light') {
    return ThemeData.dark().copyWith(
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(AppColor.lightSecondColor),
        )
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        unselectedItemColor: AppColor.white1,
        selectedItemColor: AppColor.lightSecondColor
      ),
      appBarTheme: const AppBarTheme(
        color: AppColor.darkPrimaryColor,
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: AppColor.white1,
      ),
      primaryColor: AppColor.darkPrimaryColor,
      primaryColorLight: AppColor.lightSecondColor,
      colorScheme: const ColorScheme.dark().copyWith(
        primary: AppColor.darkPrimaryColor,
        secondary: AppColor.lightSecondColor,
        background: AppColor.darkPrimaryColor,
        onBackground: AppColor.white1,
      ),
      scaffoldBackgroundColor: AppColor.darkPrimaryColor,
      iconTheme: Theme.of(context)
        .iconTheme
        .copyWith(
          color: AppColor.iconDarkColor,
        )
      ,
      textTheme: Theme.of(context)
          .textTheme
          .apply(
            fontFamily: 'HiraginoSans',
            bodyColor: AppColor.lightColor1,
          )
          .copyWith(
            titleLarge: AppText.titleLargeDark,
            titleMedium: AppText.titleMediumDark,
            titleSmall: AppText.titleSmallDark
          ),
    );
  }

  return ThemeData.light().copyWith(
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(AppColor.lightPrimaryColor),
      )
    ),
    appBarTheme: const AppBarTheme(
      color: AppColor.white1,
    ),
    primaryColor: AppColor.lightPrimaryColor,
    primaryColorLight: AppColor.lightPrimaryColor,
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColor.lightPrimaryColor,
      secondary: AppColor.lightSecondColor,
      background: AppColor.white1,
      onBackground: AppColor.darkPrimaryColor,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: AppColor.defaultColor,
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: Theme.of(context)
        .textTheme
        .apply(
          fontFamily: 'HiraginoSans',
          bodyColor: AppColor.darkPrimaryColor,
        )
        .copyWith(
          titleLarge: AppText.titleLargeLight,
          titleMedium: AppText.titleMediumLight,
          titleSmall: AppText.titleSmallLight
        ),
    outlinedButtonTheme: _buildOutlinedButtonTheme(),
  );
}

_buildOutlinedButtonTheme() {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: Colors.transparent,
      side: const BorderSide(
        style: BorderStyle.solid,
        width: 1,
        color: AppColor.lightColor2,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}
