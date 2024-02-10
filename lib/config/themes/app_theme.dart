import 'package:flutter/material.dart';
import 'package:task/core/constant/app_strings.dart';
import 'package:task/core/constant/my_sizes.dart';

class AppTheme {
  ColorScheme getCurrentColorScheme({required Brightness brightness}) {
    return (brightness) == Brightness.dark ? colorSchemeDark : colorSchemeLight;
  }

  static const colorSchemeLight = ColorScheme(
    primary: Color(0xff293E96),
    surface: Color(0xff3C76FF),
    primaryContainer: Color(0xff959595),
    secondary: Color(0xff00C0FF),
    background: Color(0xFFF7F7F7),
    error: Colors.red,
    onSecondary: Color(0xffF9E9F4),
    onSurface: Color(0xff31328A),
    onPrimary: Color(0xffffffff),
    onBackground: Color(0xff000000),
    onError: Color(0xffffffff),
    brightness: Brightness.light,
  );

  static const colorSchemeDark = ColorScheme(
    primary: Color(0xff293E96),
    surface: Color(0xff3C76FF),
    primaryContainer: Color(0xff4A4A4A),
    secondary: Color(0xff00C0FF),
    background: Color(0xff000000),
    error: Colors.red,
    onSecondary: Color(0xffF9E9F4),
    onSurface: Color(0xff31328A),
    onPrimary: Color(0xffffffff),
    onBackground: Color(0xffF1F1F1),
    onError: Color(0xffffffff),
    brightness: Brightness.dark,
  );

  ThemeData getTheme(Brightness brightness) {
    var colorScheme = getCurrentColorScheme(brightness: brightness);
    var textTheme = getTextTheme(brightness: brightness);
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: colorScheme.background,
      primaryColor: colorScheme.primary,
      fontFamily: AppString.fontFamily,
      textTheme: textTheme,
      dialogBackgroundColor: colorScheme.background,
      dialogTheme: DialogTheme(
        backgroundColor: colorScheme.background,
        shape: RoundedRectangleBorder(borderRadius: MySizes.circleBorderRadius),
      ),
      inputDecorationTheme: inputDecorationTheme(brightness: brightness),
      elevatedButtonTheme: elevatedButtonThemeData(brightness: brightness),
      outlinedButtonTheme: outlinedButtonThemeData(brightness: brightness),
      textButtonTheme: textButtonThemeData(brightness: brightness),
      datePickerTheme: datePickerTheme(brightness: brightness),
      timePickerTheme: timePickerTheme(brightness: brightness),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.background;
          } else if (states.contains(MaterialState.selected)) {
            return colorScheme.secondary;
          } else {
            return colorScheme.background;
          }
        }),
        checkColor: MaterialStatePropertyAll(colorScheme.onPrimary),
        side: BorderSide(width: 2, color: colorScheme.onPrimaryContainer.withOpacity(0.4)),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      ),
      colorScheme: colorScheme.copyWith(background: colorScheme.background),
      splashColor: colorScheme.primaryContainer.withOpacity(.5),
      highlightColor: colorScheme.primaryContainer.withOpacity(.5),
      switchTheme: switchThemeData(brightness: brightness),
    );
  }

  InputDecoration searchInputDecoration(Brightness brightness) {
    var colorScheme = getCurrentColorScheme(brightness: brightness);
    return const TextField().decoration!.copyWith(
          contentPadding: const EdgeInsets.symmetric(horizontal: MySizes.largePadding),
          hintStyle: getTextTheme(brightness: brightness).bodyLarge?.copyWith(
                color: colorScheme.onPrimaryContainer.withOpacity(.5),
              ),
          fillColor: colorScheme.onPrimary,
          filled: true,
          isDense: false,
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 1.5, color: colorScheme.primaryContainer),
            borderRadius: MySizes.circleBorderRadius,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.5, color: colorScheme.primary),
            borderRadius: MySizes.circleBorderRadius,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.5, color: colorScheme.primaryContainer),
            borderRadius: MySizes.circleBorderRadius,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.5, color: colorScheme.error),
            borderRadius: MySizes.circleBorderRadius,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.5, color: colorScheme.error),
            borderRadius: MySizes.circleBorderRadius,
          ),
          prefixIcon: Container(
            width: MySizes.buttonHeight,
            height: MySizes.buttonHeight,
            margin: const EdgeInsetsDirectional.only(start: MySizes.defaultPadding * .25),
            padding: const EdgeInsets.all(MySizes.defaultPadding * .75),
            // child: SvgPicture.asset(
            //   Images.searchSolid,
            //   color: colorScheme.onPrimaryContainer,
            // ),
          ),
        );
  }

  TextTheme getTextTheme({required Brightness brightness}) {
    var colorScheme = getCurrentColorScheme(brightness: brightness);
    return TextTheme(
      displayLarge: TextStyle(color: colorScheme.onBackground, fontSize: 96, fontWeight: FontWeight.w400),
      displayMedium: TextStyle(color: colorScheme.onBackground, fontSize: 60, fontWeight: FontWeight.w400),
      displaySmall: TextStyle(color: colorScheme.onBackground, fontSize: 48, fontWeight: FontWeight.w400),
      headlineMedium: TextStyle(color: colorScheme.onBackground, fontSize: 34, fontWeight: FontWeight.w400),
      headlineSmall: TextStyle(color: colorScheme.onBackground, fontSize: 24, fontWeight: FontWeight.w700),
      titleLarge: TextStyle(color: colorScheme.onBackground, fontSize: 20, fontWeight: FontWeight.w700),
      titleMedium: TextStyle(color: colorScheme.onBackground, fontSize: 18, fontWeight: FontWeight.w700),
      titleSmall: TextStyle(color: colorScheme.onBackground, fontSize: 16, fontWeight: FontWeight.w400),
      bodyLarge: TextStyle(color: colorScheme.onBackground, fontSize: 15, fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(color: colorScheme.onBackground, fontSize: 15, fontWeight: FontWeight.w400),
      labelLarge: TextStyle(color: colorScheme.onBackground, fontSize: 15, fontWeight: FontWeight.w700),
      bodySmall: TextStyle(color: colorScheme.onBackground, fontSize: 13, fontWeight: FontWeight.w400),
      labelSmall: TextStyle(color: colorScheme.onBackground, fontSize: 11, fontWeight: FontWeight.w400),
    );
  }

  DatePickerThemeData datePickerTheme({required Brightness brightness}) {
    var colorScheme = getCurrentColorScheme(brightness: brightness);
    var textTheme = getTextTheme(brightness: brightness);
    return DatePickerThemeData(
      backgroundColor: colorScheme.background,
      surfaceTintColor: colorScheme.background,
      headerHeadlineStyle: textTheme.titleMedium,
      yearForegroundColor: MaterialStateProperty.all<Color?>(colorScheme.onBackground),
      dividerColor: colorScheme.primaryContainer,
    );
  }

  TimePickerThemeData timePickerTheme({required Brightness brightness}) {
    var colorScheme = getCurrentColorScheme(brightness: brightness);
    var textTheme = getTextTheme(brightness: brightness);
    return TimePickerThemeData(
      backgroundColor: colorScheme.background,
      helpTextStyle: textTheme.titleMedium,
      hourMinuteColor: colorScheme.primaryContainer,
      hourMinuteTextColor: colorScheme.onBackground,
      hourMinuteTextStyle: textTheme.headlineMedium?.copyWith(
        height: 2.5,
        fontWeight: FontWeight.w700,
      ),
      dayPeriodTextStyle: textTheme.labelLarge,
      dayPeriodBorderSide: BorderSide(width: 1.5, color: colorScheme.primaryContainer),
      dayPeriodTextColor: colorScheme.onBackground,
      dayPeriodColor: MaterialStateColor.resolveWith(
        (states) {
          return states.contains(MaterialState.selected)
              ? colorScheme.primary.withOpacity(.5)
              : colorScheme.primaryContainer;
        },
      ),
    );
  }

  TextButtonThemeData textButtonThemeData({required Brightness brightness}) {
    var colorScheme = getCurrentColorScheme(brightness: brightness);
    return TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle?>(
          getTextTheme(brightness: brightness).bodyMedium?.copyWith(
                fontFamily: AppString.fontFamily,
                height: 2,
                fontWeight: FontWeight.w500,
              ),
        ),
        overlayColor: MaterialStateProperty.all<Color?>(colorScheme.primaryContainer.withOpacity(.6)),
        foregroundColor: MaterialStateProperty.all<Color?>(colorScheme.onPrimaryContainer),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: MySizes.circleBorderRadius)),
        shadowColor: MaterialStateProperty.all<Color?>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(horizontal: 10, vertical: 0)),
      ),
    );
  }

  OutlinedButtonThemeData outlinedButtonThemeData({required Brightness brightness}) {
    var colorScheme = getCurrentColorScheme(brightness: brightness);
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle?>(
          getTextTheme(brightness: brightness).labelLarge?.copyWith(
                fontFamily: AppString.fontFamily,
                height: 2.3,
              ),
        ),
        foregroundColor: MaterialStateProperty.all<Color?>(colorScheme.primary),
        backgroundColor: MaterialStateProperty.all<Color?>(Colors.transparent),
        overlayColor: MaterialStateProperty.all<Color?>(colorScheme.onPrimaryContainer.withOpacity(.07)),
        shadowColor: MaterialStateProperty.all<Color?>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
        minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, MySizes.buttonHeight)),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: MySizes.circleBorderRadius),
        ),
        side: MaterialStateProperty.all<BorderSide>(BorderSide(color: colorScheme.primary, width: 2)),
      ),
    );
  }

  InputDecorationTheme inputDecorationTheme({required Brightness brightness}) {
    var colorScheme = getCurrentColorScheme(brightness: brightness);
    return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: MySizes.defaultPadding,
        vertical: MySizes.defaultPadding * 0.4,
      ),
      hintStyle: getTextTheme(brightness: brightness).bodyLarge?.copyWith(
            color: colorScheme.primaryContainer,
            height: 1.2,
          ),
      errorStyle: getTextTheme(brightness: brightness).bodySmall?.copyWith(
            color: colorScheme.error,
            height: 1.2,
          ),
      filled: true,
      fillColor: colorScheme.background,
      isDense: false,
      errorMaxLines: 2,
      border: OutlineInputBorder(
        borderSide: BorderSide(width: 1.5, color: colorScheme.background),
        borderRadius: MySizes.borderRadius,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1.5, color: colorScheme.primary),
        borderRadius: MySizes.borderRadius,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1.5, color: colorScheme.background),
        borderRadius: MySizes.borderRadius,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1.5, color: colorScheme.error),
        borderRadius: MySizes.borderRadius,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1.5, color: colorScheme.error),
        borderRadius: MySizes.borderRadius,
      ),
    );
  }

  ElevatedButtonThemeData elevatedButtonThemeData({required Brightness brightness}) {
    var colorScheme = getCurrentColorScheme(brightness: brightness);
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle?>(
          getTextTheme(brightness: brightness).bodyLarge?.copyWith(
                height: 1.8,
                fontWeight: FontWeight.w600,
                fontFamily: AppString.fontFamily,
              ),
        ),
        backgroundColor: MaterialStateProperty.all<Color?>(Colors.transparent),
        foregroundColor: MaterialStateProperty.all<Color?>(colorScheme.onPrimary),
        elevation: MaterialStateProperty.all<double>(0),
        shadowColor: MaterialStateProperty.all<Color?>(Colors.transparent),
        minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, MySizes.buttonHeight)),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: MySizes.circleBorderRadius),
        ),
      ),
    );
  }

  SwitchThemeData switchThemeData({required Brightness brightness}) {
    var colorScheme = getCurrentColorScheme(brightness: brightness);
    return SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        return colorScheme.onPrimary;
      }),
      trackColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return colorScheme.primary;
        } else {
          return colorScheme.onPrimaryContainer;
        }
      }),
      trackOutlineColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.transparent;
        } else {
          return colorScheme.onPrimaryContainer;
        }
      }),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
