import 'package:flutter/material.dart';

import 'color.dart';

final ThemeData appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: accentColor,
  );
  final ThemeData base = ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      accentColorBrightness: Brightness.light,
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      buttonColor: accentColor,
      indicatorColor: Colors.white,
      toggleableActiveColor: accentColor,
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,
      accentColor: accentColor,
      canvasColor: whiteColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      backgroundColor: whiteColor,
      errorColor: errorColor,
      focusColor: accentColor,
      highlightColor: accentColor,
      secondaryHeaderColor: accentColor,
      buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        height: 50,
        buttonColor: accentColor,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(
          fontSize: 11,
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(3))),
      ));
  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(
      base.primaryTextTheme,
    ),
    accentTextTheme: _buildTextTheme(base.accentTextTheme, color: whiteColor),
  );
}

TextTheme _buildTextTheme(TextTheme base, {Color color}) {
  return base
      .copyWith(
        headline1:
            base.headline1.copyWith(fontSize: 40, fontWeight: FontWeight.w500),
        headline3: base.headline3
            .copyWith(fontWeight: FontWeight.bold, color: color, fontSize: 25),
        headline2:
            base.headline2.copyWith(fontSize: 27, fontWeight: FontWeight.w500),
        headline6: base.headline6.copyWith(
            fontSize: 18.0, color: color, fontWeight: FontWeight.bold),
        subtitle1: base.subtitle1.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        subtitle2: base.subtitle2.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        caption: base.caption.copyWith(
            fontWeight: FontWeight.normal, fontSize: 12.0, color: color),
        bodyText2: base.bodyText2.copyWith(fontSize: 14.0, color: color),
        bodyText1: base.bodyText1
            .copyWith(fontSize: 14.0, wordSpacing: 2, color: color),
        button: base.button.copyWith(
            fontWeight: FontWeight.bold, fontSize: 16.0, color: color),
      )
      .apply(
          //fontFamily: 'OpenSans',
          );
}
