import 'package:flutter/material.dart';

import '../styles/app_styles.dart';
import '../styles/text_styles.dart';
import 'colors.dart';

class ThemeConfiguration {
  static ThemeConfiguration? _instance;

  ThemeConfiguration._();

  static ThemeConfiguration get instance {
    _instance ??= ThemeConfiguration._();
    return _instance!;
  }

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: CustomColors.instance.customInputBorderSideColor!,
      width: 1,
    ),
  );

  static final theme = ThemeData(
    // ScaffoldConfigurationArea
    scaffoldBackgroundColor: CustomColors.instance.customScaffoldBackgroundColor,
    // ElevatedButtonConfigurationArea
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: AppStyles.instance.primaryButton,
    ),
    // InputDecorationConfigurationArea
    inputDecorationTheme: InputDecorationTheme(
      fillColor: CustomColors.instance.customInputDecorationFillColor,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(20),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      labelStyle: TextStyles.instance.textRegular.copyWith(color: CustomColors.instance.customBlackUIColor),
      errorStyle: TextStyles.instance.textRegular.copyWith(color: CustomColors.instance.customErrorUIColor),
    ),
  );
}
