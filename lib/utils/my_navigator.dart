import 'package:flutter/material.dart';

class MyNavigator {

  static void goToHome(BuildContext context) {
    Navigator.pushNamed(context, "/homepage");
  }

  static void goToIntro(BuildContext context) {
    Navigator.pushNamed(context, "/welcome");
  }

  static void goToGame(BuildContext context) {
    Navigator.pushNamed(context, "/game");
  }


  static void goMenu(BuildContext context) {
    Navigator.pushNamed(context, "/homepage");
  }
}
