import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';
import 'color_resources.dart';


class AppThemes {
  static const int darkBlue = 0;
  static const int lightOrange = 1;

  ThemeCollection getThemeCollections() {
    final ThemeData base = ThemeData.light();
    final ButtonThemeData darkButtonTheme =
    base.buttonTheme.copyWith(buttonColor: ColorResource.colorF58220);
    final FloatingActionButtonThemeData darkFABTheme =
        base.floatingActionButtonTheme;
    return ThemeCollection(themes: {
      AppThemes.darkBlue: ThemeData(
          buttonTheme: darkButtonTheme,
          primaryColor: ColorResource.colorE22C24,
          textTheme: AppThemes().basicTextTheme(base.textTheme),
          floatingActionButtonTheme: darkFABTheme.copyWith(
              backgroundColor: ColorResource.colorF58220), colorScheme: ColorScheme.fromSwatch(primarySwatch: const MaterialColor(
            0xff020E36,
            <int, Color>{
              50: Color(0xff020E36),
              100: Color(0xff020E36),
              200: Color(0xff020E36),
              300: Color(0xff020E36),
              400: Color(0xff020E36),
              500: Color(0xff020E36),
              600: Color(0xff020E36),
              700: Color(0xff020E36),
              800: Color(0xff020E36),
              900: Color(0xff020E36),
            },
          )).copyWith(background: ColorResource.colorFFFFFF)),
      AppThemes.lightOrange: ThemeData(
          primarySwatch: const MaterialColor(
            0xffFDF3E6,
            <int, Color>{
              50: Color(0xffFDF3E6),
              100: Color(0xffFDF3E6),
              200: Color(0xffFDF3E6),
              300: Color(0xffFDF3E6),
              400: Color(0xffFDF3E6),
              500: Color(0xffFDF3E6),
              600: Color(0xffFDF3E6),
              700: Color(0xffFDF3E6),
              800: Color(0xffFDF3E6),
              900: Color(0xffFDF3E6),
            },
          ),
          buttonTheme: darkButtonTheme,
          textTheme: AppThemes().basicTextTheme(base.textTheme),
          floatingActionButtonTheme: darkFABTheme.copyWith(
              backgroundColor: ColorResource.colorFDF3E6)),
    });
  }

  static String toStr(int themeId) {
    switch (themeId) {
      case darkBlue:
        return 'Dark Blue';
      case lightOrange:
        return 'Light Orange';
      default:
        return 'Unknown';
    }
  }

  TextTheme basicTextTheme(TextTheme base) {
    return base.copyWith(
      //Used for font size of 6
      bodySmall: base.bodySmall!.copyWith(
          fontFamily: 'Poppins-Regular',
          fontSize: 6.0,
          color: ColorResource.colorFFFFFF,
          fontWeight: FontWeight.w400),
      //Used for font size of 12//subTitle
      titleMedium: base.titleMedium!.copyWith(
          fontFamily: 'Poppins-Regular',
          fontSize: 14,
          color: ColorResource.color767C86,
          fontWeight: FontWeight.w700),

      titleSmall: base.titleSmall!.copyWith(
          fontFamily: 'Poppins-Regular',
          fontSize: 13.0,
          color: ColorResource.color767C86,
          fontWeight: FontWeight.w300
      ),


      //Used for font size of 14,16//labelText
      bodyMedium: base.bodyMedium!.copyWith(
        fontFamily: 'Poppins-Regular',
        fontSize: 14.0,
        color: ColorResource.color767C86,
      ),

      //Used for emphasizing text and font size of 18,20,22//hintText
      bodyLarge: base.bodyLarge!.copyWith(
          fontFamily: 'Poppins-Regular',
          fontSize: 14.0,
          color: ColorResource.color414A58
      ),

      //Used for large text in dialogs and font size of 24
      displayLarge: base.displayLarge!.copyWith(
          fontFamily: 'Poppins-Medium',
          fontSize: 22.0,
          color: ColorResource.color333333,
          fontWeight: FontWeight.bold),

      //Used for the primary text in app bars and font size of 26,28 and greater
      displayMedium: base.displayMedium!.copyWith(
          fontFamily: 'Poppins-Medium',
          fontSize: 18.0,
          color: ColorResource.color333333,
          fontWeight: FontWeight.w700),

      //used for button  //Title
      displaySmall: base.displaySmall!.copyWith(
        fontFamily: 'Poppins-Medium',
        fontSize: 16.0,
        color: ColorResource.color333333,
        fontWeight: FontWeight.w600,
      ),

      labelLarge: base.labelLarge!.copyWith(
        fontFamily: 'Poppins-Regular',
        fontSize: 16.0,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),

    );
  }
}
