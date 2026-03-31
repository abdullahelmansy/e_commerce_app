import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstants {
  //colors
  static Color primaryColor = const Color(0xFF085B63);
  static Color secondaryColor = primaryColor.withValues(alpha: 0.7);
  static Color backgroundColor =  Colors.white;
  static Color textColor = const Color(0xFF1A1A1A);
  static Color greyColor = const Color(0xFFF5F5F5);

  //text styles
  static TextStyle headingStyle = GoogleFonts.outfit(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textColor,
  );
  static TextStyle titleStyle = GoogleFonts.outfit(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: textColor,
  );
  static TextStyle bodyStyle = GoogleFonts.outfit(
    fontSize: 16,
    color: textColor,
  );

  //Padding
  static double defaultPadding = 16.0;
  static double smallPadding = 8.0;
  static double largePadding = 24.0;

  //Border radius
  static double defaultBorderRadius = 26.0;
  static double smallBorderRadius = 8.0;
  static double largeBorderRadius = 16.0;

  //Animation durations
  static Duration defaultDuration = const Duration(milliseconds: 300);


}