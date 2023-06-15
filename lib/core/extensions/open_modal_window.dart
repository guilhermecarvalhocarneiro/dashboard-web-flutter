import 'package:flutter/material.dart';

import '../helpers/nuvols_logger.dart';

extension OpenModalWindowExtension on BuildContext {
  Route openModalWindow(Widget widget) {
    NuvolsLogger.instance.debug('Open modal window');
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      opaque: false,
      transitionDuration: const Duration(milliseconds: 600),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
