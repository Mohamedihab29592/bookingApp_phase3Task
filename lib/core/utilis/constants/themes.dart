import 'package:booking_app/core/utilis/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemes{
  static final darkMode=ThemeData(

elevatedButtonTheme: ElevatedButtonThemeData(style:ButtonStyle(backgroundColor:MaterialStateProperty.all(AppColors.darkGrey),foregroundColor:MaterialStateProperty.all(Colors.white) ) ),
cardTheme: CardTheme(color: AppColors.darkGrey),
    scaffoldBackgroundColor: AppColors.kPrimaryColor,
    colorScheme: const ColorScheme.dark(),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkGrey,
      selectedItemColor: AppColors.teal,
      unselectedItemColor: AppColors.grey,
      elevation: 20,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(
        color: AppColors.teal,
      ),
      unselectedLabelStyle: const TextStyle(
        color: AppColors.grey,
      ),
    ),
    buttonTheme: const ButtonThemeData(
       buttonColor: AppColors.teal,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.kPrimaryColor,
      elevation: 0,
      titleTextStyle: const TextStyle(
          color: AppColors.white, fontSize: 20, fontWeight: FontWeight.bold),
      iconTheme: const IconThemeData(
        color: AppColors.teal,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      subtitle1: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
      subtitle2: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.grey,
        height: 1.3,
      ),
    ),
  );


  static final lightMode=ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(style:ButtonStyle(backgroundColor:MaterialStateProperty.all(AppColors.white74),foregroundColor:MaterialStateProperty.all(Colors.black) ) ),

    cardTheme: const CardTheme(color: AppColors.white),


    scaffoldBackgroundColor: AppColors.white,
    colorScheme: const ColorScheme.light(),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.teal,
      unselectedItemColor: AppColors.grey,
      elevation: 20,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        color: AppColors.teal,
      ),
      unselectedLabelStyle: TextStyle(
        color: AppColors.grey,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.teal,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
          color: AppColors.black, fontSize: 20, fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(
        color: AppColors.teal,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      subtitle1: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
      subtitle2: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.grey,
        height: 1.3,
      ),
    ),


  );
}