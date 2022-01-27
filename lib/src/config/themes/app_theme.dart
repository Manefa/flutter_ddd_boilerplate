import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/core/constants/color_constants.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Color(0XFF317D33),
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: ColorConstants.primaryColorLight,
      splashColor: Colors.transparent,
    );
  }

  static ThemeData get dark {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Color(0XFF317D33),
      ),
      scaffoldBackgroundColor: ColorConstants.dark,
      primaryColor: ColorConstants.primaryColorDark,
      splashColor: Colors.transparent,
    );
  }
}
