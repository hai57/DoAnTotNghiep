class SettingBlockItemModel {
  String iconLight;
  String iconDark;
  String label;
  String router;
  bool toogle;
  bool isPopup;
  SettingBlockItemModel({
    this.toogle = false,
    this.isPopup = false,
    required this.iconLight,
    required this.iconDark,
    required this.label,
    required this.router,
  });
}
