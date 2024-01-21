import 'package:healthy_app/constant/images.dart';
import 'package:healthy_app/model/setting/index.dart';
import 'package:healthy_app/router/index.dart';

List<SettingBlockItemModel> listRenderSecurity = [
  SettingBlockItemModel(iconLight: IconConstantsLight.password, iconDark: IconConstantsDark.password, label: "changepassword", router: Routes.startScreen),
  SettingBlockItemModel(iconLight: IconConstantsLight.resetPassword, iconDark: IconConstantsDark.resetPassword, label: "forgotpassword", router: Routes.startScreen),
  SettingBlockItemModel(iconLight: IconConstantsLight.security, iconDark: IconConstantsDark.security, label: "security", router: Routes.startScreen),
];
List<SettingBlockItemModel> listRenderGeneral = [
  SettingBlockItemModel(iconLight: IconConstantsLight.language, iconDark: IconConstantsDark.language, label: "language", router: Routes.startScreen, isPopup: true),
  SettingBlockItemModel(iconLight: IconConstantsLight.trash, iconDark: IconConstantsDark.trash, label: "clearcache", router: Routes.startScreen),
];
List<SettingBlockItemModel> listRenderAbout = [
  SettingBlockItemModel(iconLight: IconConstantsLight.policies, iconDark: IconConstantsDark.policies, label: "legalandpolicies", router: Routes.startScreen),
  SettingBlockItemModel(iconLight: IconConstantsLight.question, iconDark: IconConstantsDark.question, label: "helpsupport", router: Routes.startScreen),
  SettingBlockItemModel(iconLight: IconConstantsLight.mode, iconDark: IconConstantsDark.mode, label: "darkmode", router: Routes.startScreen, toogle: true),
];
