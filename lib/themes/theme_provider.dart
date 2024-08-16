import 'package:flutter/material.dart';
import 'package:twitter_clone/themes/light_mode.dart';
import 'package:twitter_clone/themes/dark_mode.dart';

/*
Theme provider
change the app from darkmode to lightmode
*/

class ThemeProvider with ChangeNotifier {
  //initially lightmode
  ThemeData _themeData = lightMode;

  //get the current theme
  ThemeData get themeData => _themeData;

  //is it dark mode?

  bool get isDarkMode => _themeData == darkMode;

  //set the theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;

    //update UI

    notifyListeners();
  }

  // toggle between dark and light

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
