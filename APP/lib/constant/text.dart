import 'package:flutter/material.dart';

import 'package:healthy_app/constant/color.dart';

class AppText {
  // Light
  static const titleLargeLight = TextStyle(
    fontSize: 24,
    color: AppColor.defaultColor,
    fontWeight: FontWeight.bold,
  );
  static const titleMediumLight = TextStyle(
    fontSize: 16,
    color: AppColor.defaultColor,
    fontWeight: FontWeight.bold,
  );
  static const titleSmallLight = TextStyle(
    fontSize: 13,
    color: AppColor.defaultColor,
    fontWeight: FontWeight.bold,
  );
  static const textWhite = TextStyle(
    fontSize: 13,
    color: AppColor.white1,
    fontWeight: FontWeight.w500,
  );
  static const textWhiteLarge = TextStyle(
    fontSize: 24,
    color: AppColor.white1,
    fontWeight: FontWeight.w500,
  );
  static const textSecondary = TextStyle(
    fontSize: 13,
    color: AppColor.lightSecondColor,
    fontWeight: FontWeight.w500,
  );
  static const textSuccess = TextStyle(
    fontSize: 15,
    color: AppColor.success,
    fontWeight: FontWeight.w500,
  );
  static const textError = TextStyle(
    fontSize: 15,
    color: AppColor.error,
    fontWeight: FontWeight.w500,
  );
  // Dark
  static const titleLargeDark = TextStyle(
    fontSize: 24,
    color: AppColor.white1,
    fontWeight: FontWeight.bold,
  );
  static const titleMediumDark = TextStyle(
    fontSize: 16,
    color: AppColor.white1,
    fontWeight: FontWeight.bold,
  );
  static const titleSmallDark = TextStyle(
    fontSize: 13,
    color: AppColor.white1,
    fontWeight: FontWeight.bold,
  );
}
