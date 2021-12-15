import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final Color kBgColor = Color(0xffE8F8FF);
  static final Color kPrimaryColor = Color(0xff2B3342);
  static final Color kSecondaryColor = Color(0xff4E5860);
  static final Color kTileColor = Color(0xffF1F1F1);
  static final Color kDarkTextColor = Color(0xff131127);
  static final Color kDarkShadeColor = Color(0xff01002E);

  static TextTheme kMainTextTheme = TextTheme(
    headline1: GoogleFonts.arapey(
        textStyle: TextStyle(fontSize: 40, color: AppTheme.kDarkTextColor)),
    headline2: GoogleFonts.arapey(
        textStyle: TextStyle(fontSize: 40, color: AppTheme.kDarkTextColor)),
    headline3: GoogleFonts.arapey(
        textStyle: TextStyle(fontSize: 40, color: AppTheme.kDarkTextColor)),
    headline5: GoogleFonts.poppins(),
    headline6: GoogleFonts.poppins(
        textStyle: TextStyle(color: AppTheme.kDarkTextColor)),
    
    bodyText1: GoogleFonts.arapey(
        textStyle: TextStyle(color: Colors.white70, fontSize: 36)),
    bodyText2: GoogleFonts.arapey(
        textStyle: TextStyle(color: Colors.black87, fontSize: 30)),
    
caption: GoogleFonts.roboto(
      textStyle: TextStyle(color: Colors.white60),
    ),
  );
}
