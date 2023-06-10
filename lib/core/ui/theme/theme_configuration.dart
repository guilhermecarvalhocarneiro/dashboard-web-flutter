import 'package:flutter/material.dart';

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
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: CustomColors.instance.customInputBorderSideColor!,
      width: 0.55,
    ),
  );

  static final theme = ThemeData(
    // ScaffoldConfigurationArea
    scaffoldBackgroundColor: CustomColors.instance.customScaffoldBackgroundColor,
    // InputDecorationConfigurationArea
    inputDecorationTheme: InputDecorationTheme(
      fillColor: CustomColors.instance.customInputDecorationFillColor,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(20),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      alignLabelWithHint: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      labelStyle: TextStyles.instance.textRegular
          .copyWith(color: CustomColors.instance.customBlackUIColor)
          .copyWith(fontSize: 14),
      errorStyle: TextStyles.instance.textRegular
          .copyWith(color: CustomColors.instance.customErrorUIColor)
          .copyWith(fontSize: 14),
    ),
  );
}
