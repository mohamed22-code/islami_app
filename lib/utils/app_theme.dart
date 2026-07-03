import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/utils/app_colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.blackColor,
      showUnselectedLabels: true
    ),


    textTheme: TextTheme(
      headlineLarge: GoogleFonts.hind(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor
      ),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackBgColor,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: AppColors.primaryColor
      ),
    )
  );
}