import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = Color(0xFFF6F8FA);
Color darkPrimaryColor = Color(0xFF191720);
Color whiteBackground = Color(0xFFE8F0FE);
Color darkBlue = Color(0xFF1A2755);
Color mediumBlue = Color(0xFF1D368A);
Color greyBg = Color(0xFFCAD0DC);

final TextTheme myTextTheme = TextTheme(
  displayLarge: GoogleFonts.poppins(
      fontSize: 45,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.25,
      color: primaryColor),
  displayMedium: GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.25,
      color: darkPrimaryColor),
  displaySmall: GoogleFonts.poppins(
      fontSize: 28, fontWeight: FontWeight.bold, color: darkPrimaryColor),
  headlineLarge: GoogleFonts.poppins(
      fontSize: 22, fontWeight: FontWeight.w600, color: primaryColor),
  headlineMedium: GoogleFonts.poppins(
      fontSize: 20, fontWeight: FontWeight.w600, color: mediumBlue),
  headlineSmall: GoogleFonts.rubik(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: darkPrimaryColor,
      letterSpacing: 0.15),
  bodyLarge: GoogleFonts.poppins(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.15,
      color: darkBlue),
  bodyMedium: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.1,
      color: darkBlue),
  bodySmall: GoogleFonts.poppins(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.1,
      color: darkPrimaryColor),
  labelLarge: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: darkPrimaryColor,
      letterSpacing: 0.5),
  labelMedium: GoogleFonts.poppins(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: darkPrimaryColor),
  labelSmall: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: darkPrimaryColor),
);

final themeData = ThemeData(
  textTheme: myTextTheme,
  primaryColor: primaryColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: darkBlue),
  scaffoldBackgroundColor: Colors.white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 16.0,
    showUnselectedLabels: true,
    unselectedItemColor: greyBg,
    selectedItemColor: whiteBackground,
    type: BottomNavigationBarType.fixed,
    backgroundColor: mediumBlue,
  ),
);
