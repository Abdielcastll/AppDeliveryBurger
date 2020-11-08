import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryColors {
  static final purple = Color(0xFF410c61);
  static final green = Color(0xFF357e46);
  static final dark = Color(0xff03091E);
  static final grey = Color(0xff212738);
  static final lightGrey = Color(0xffBBBBBB);
  static final veryLightGrey = Color(0xFFF3F3F3);
  static final white = Color(0xFFFFFFFF);
  static final pink = Color(0xffF5638B);
}

final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
        color: DeliveryColors.veryLightGrey, style: BorderStyle.solid));
final _borderDark = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide:
        BorderSide(color: DeliveryColors.grey, style: BorderStyle.solid));

final lightTheme = ThemeData(
  
    appBarTheme: AppBarTheme(
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          headline6: TextStyle(
            color: DeliveryColors.purple,
            fontSize: 25.0,
            fontWeight: FontWeight.bold
          )
        ),
        color: DeliveryColors.white,
        centerTitle: true,
        elevation: 1),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: DeliveryColors.veryLightGrey,
      elevation: 2.0,
      backgroundColor: DeliveryColors.lightGrey) ,
    buttonColor: DeliveryColors.green,
    cursorColor: DeliveryColors.lightGrey,
    accentColor: DeliveryColors.white,
    textTheme: GoogleFonts.poppinsTextTheme().apply(
        displayColor: DeliveryColors.purple, bodyColor: DeliveryColors.purple),
    inputDecorationTheme: InputDecorationTheme(
      border: _border,
      disabledBorder: _border,
      enabledBorder: _border,
      focusedBorder: _border,
      fillColor: DeliveryColors.white,
    ),
    iconTheme: IconThemeData(color: DeliveryColors.purple),
    backgroundColor: DeliveryColors.white,


);

final darkTheme = ThemeData(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: DeliveryColors.purple,
      elevation: 2.0,
      backgroundColor: DeliveryColors.lightGrey) ,
    appBarTheme: AppBarTheme(
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          headline6: TextStyle(
            color: DeliveryColors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold
          )
        ),
        color: DeliveryColors.purple,
        centerTitle: true,
        elevation: 1),
    buttonColor: DeliveryColors.green,
    cursorColor: DeliveryColors.lightGrey,
    accentColor: DeliveryColors.grey,
    textTheme: GoogleFonts.poppinsTextTheme().apply(
        displayColor: DeliveryColors.white, bodyColor: DeliveryColors.green),
    inputDecorationTheme: InputDecorationTheme(
        border: _borderDark,
        disabledBorder: _borderDark,
        enabledBorder: _borderDark,
        focusedBorder: _borderDark,
        fillColor: DeliveryColors.grey,
        filled: true),
    iconTheme: IconThemeData(color: DeliveryColors.white),
    scaffoldBackgroundColor: DeliveryColors.dark,
    );
