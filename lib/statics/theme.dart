/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : Theme definition file                                                                              ***//
//*** Date   : 11Mar2022                                                                                          ***//
//*** Version: V05                                                                                                ***//
/*===================================================================================================================*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData theme = ThemeData(
  primaryColor: Colors.indigo,
  primarySwatch: Colors.teal,
  colorScheme: const ColorScheme.light(
    primary: Colors.indigo,
    secondary: Colors.teal,
  ),
  backgroundColor: Colors.black,
  scaffoldBackgroundColor: Colors.white.withRed(240).withGreen(240),
  unselectedWidgetColor: Colors.grey,
  textTheme: textTheme,
  fontFamily: 'Muli',
  appBarTheme: appBarTheme,
);
ThemeData darkTheme = ThemeData(
  primaryColor: Colors.black45,
  primaryColorDark: Colors.black87,
);
// ThemeData(
//   primarySwatch: Colors.indigo,
//   accentColor: Colors.teal,
//   scaffoldBackgroundColor: Colors.white,
//   appBarTheme: appBarTheme,
//   textTheme: textTheme,
//   fontFamily: 'Muli',
//   inputDecorationTheme: inputDecorationTheme(),
// );

AppBarTheme appBarTheme = AppBarTheme(
  centerTitle: true,
  // color: Colors.amber[100],
  color: Colors.white.withGreen(240).withRed(240),
  elevation: 3,
  iconTheme: const IconThemeData(color: Colors.black87),
  systemOverlayStyle: SystemUiOverlayStyle.light,
  titleTextStyle: const TextStyle(
    color: Color(0xFFCF236B),
    // color: Colors.amber[900],
    // color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  ),
);

TextTheme textTheme = TextTheme(
  bodyText1: TextStyle(color: Colors.yellow[900]),
  bodyText2: const TextStyle(color: Color(0xFF725775)),
);
