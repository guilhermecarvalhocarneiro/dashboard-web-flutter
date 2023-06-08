import 'package:flutter/material.dart';

extension SizeExtensions on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenShortestSide => MediaQuery.of(this).size.shortestSide;
  double get screenLongestSide => MediaQuery.of(this).size.longestSide;

  double percentWidth(double percent) => screenWidth * percent;
  double percentHeight(double percent) => screenHeight * percent;

  double percentShortestSide(double percent) => screenShortestSide * percent;
  double percentLongestSide(double percent) => screenLongestSide * percent;

  double get percentWidthFactor {

    if (screenWidth < 800) {
      return .09;
    } else if (screenWidth < 999) {
      return .06;
    } else if (screenWidth < 1024) {
      return .05;
    } else if (screenWidth < 1500) {
      return .05;
    } else {
      return .04;
    }
  }

  double get percentHeightFactor => screenHeight < 600
      ? .20
      : screenHeight < 1024
          ? 0.15
          : 0.062;
}
