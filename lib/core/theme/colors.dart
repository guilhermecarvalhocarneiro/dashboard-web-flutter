import 'package:flutter/material.dart';

import '../ui/default_opacity_values/dashboard_opacity.dart';

class CustomColors {
  static CustomColors? _instance;

  CustomColors._();

  static CustomColors get instance {
    _instance ??= CustomColors._();
    return _instance!;
  }

  final customBlackUIColorWithOpcatity = Colors.black.withOpacity(defaultOpacityMenuDashboard);
  final customHeaderAppUIColorWithOpcatity = Colors.white.withOpacity(defaultOpacityHeaderDashboard);
  final customFooterAppUIColorWithOpcatity = Colors.white.withOpacity(defaultOpacityFooterDashboard);
  final customContentAreaAppUIColorWithOpcatity = Colors.white.withOpacity(defaultOpacityContentAreaDashboard);
  final customSubMenuAppUIColorWithOpcatity = Colors.white.withOpacity(defaultOpacitySubMenuDashboard);
  final customMenuItenSelected = Colors.white;
  final customSubMenuItenSelected = Colors.blueGrey[700];
  final customBackgroundColorMenuItenSelected = Colors.white24;
  final customBackgroundColorSubMenuItenSelected = Colors.white24;
  final customIconLabelSubMenuItenSelected = Colors.white60;
}
