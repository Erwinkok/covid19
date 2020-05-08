import 'package:flutter/material.dart';

class CustomColors {
  static Color background = Color(0xFFF8F8F8);
  static Color link = Color(0xFF2b80ce);
  static Color orange = Color(0xFFf7d6bd);
  static Color red = Color(0xFFff4141);
  static Color green = Color(0xFF5bde7d);
  static Color title = Color(0xFF131313);
  static Color subTitle = Color(0xFF868686);
  static Color text = Color(0xFF505050);

  CustomColors(BuildContext context) {
    toggleColorTheme(context);
  }

  changeTheme(BuildContext context) {
    toggleColorTheme(context);
  }

  void toggleColorTheme(BuildContext context) {
     if (Theme.of(context).brightness == Brightness.dark) {
      setDarkColors();
    } else {
      setLightColors();
    }
  }

  void setDarkColors() {
    background = Color(0xFF0c1946);
    title = Color(0xFFFFFFFF);
    subTitle = Color(0xFFF8F8F8);
    text = Color(0xFFFFFFFF);
  }

  void setLightColors() {
    background = Color(0xFFF8F8F8);
    title = Color(0xFF131313);
    subTitle = Color(0xFF868686);
    text = Color(0xFF505050);
  }
}