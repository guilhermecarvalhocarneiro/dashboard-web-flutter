import 'package:flutter/material.dart';

class CustomColors {
  static CustomColors? _instance;

  CustomColors._();

  static CustomColors get instance {
    _instance ??= CustomColors._();
    return _instance!;
  }

  final customBlackUIColorWithOpcatity = Colors.black.withOpacity(.32);
}
