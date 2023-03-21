import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeMode _themeMode;

  ThemeNotifier(this._themeMode);

  getThemeMode() => _themeMode;

  setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    notifyListeners();
  }
}

class AppTheme {
  get darkTheme => ThemeData(
    primarySwatch: Colors.grey,
    appBarTheme: AppBarTheme(
        color: Colors.black, systemOverlayStyle: SystemUiOverlayStyle.light),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.grey),
      labelStyle: TextStyle(color: Colors.white),
    ),
    brightness: Brightness.dark,
    canvasColor: Color(0xFF1F1F1F),
    textTheme: TextTheme(
      headline1: TextStyle(color: Colors.deepPurpleAccent,fontFamily: "PSM"),
      headline2: TextStyle(color: Colors.deepPurpleAccent,fontFamily: "PSM"),
      bodyText2: TextStyle(fontFamily: "PSM"),
      subtitle1: TextStyle(fontFamily: "PSM"),
    ),

  );

  get lightTheme => ThemeData(
    primarySwatch: Colors.grey,
    appBarTheme:
    AppBarTheme(color: Colors.grey, systemOverlayStyle: SystemUiOverlayStyle.dark,),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.grey),
      labelStyle: TextStyle(color: Colors.white),
    ),
  );
}