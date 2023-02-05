import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netgeek/core/constants/colors.dart';
import 'package:netgeek/core/constants/constants.dart';

final appTheme = ThemeData(
  primaryColor: primaryColor,
  appBarTheme: _buildAppBarTheme(),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: primaryColor,
  ),
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xfff9f9f9),
  inputDecorationTheme: _buildInputDecoration(),
  elevatedButtonTheme: _buildElevatedButtonTheme(),
  textTheme: GoogleFonts.blinkerTextTheme().copyWith(),
);

AppBarTheme _buildAppBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
  );
}

ElevatedButtonThemeData _buildElevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      minimumSize: MaterialStateProperty.all(
        const Size(
          double.infinity,
          53,
        ),
      ),
      elevation: MaterialStateProperty.all(0),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      textStyle:
          MaterialStateProperty.all(GoogleFonts.montserrat(fontSize: 16)),
      shape: MaterialStateProperty.all(const StadiumBorder()),
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return primaryColor.withOpacity(0.5);
          }

          return null;
        },
      ),
    ),
  );
}

InputDecorationTheme _buildInputDecoration() {
  const borderRadius = BorderRadius.all(
    Radius.circular(5),
  );

  return const InputDecorationTheme(
    filled: true,
    fillColor: Color(0xfff4f4f4),
    border: InputBorder.none,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: borderRadius,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
      borderRadius: borderRadius,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: borderRadius,
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
      borderRadius: borderRadius,
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: borderRadius,
    ),
    contentPadding: EdgeInsets.symmetric(
      horizontal: kPadding,
      vertical: 15,
    ),
  );
}
