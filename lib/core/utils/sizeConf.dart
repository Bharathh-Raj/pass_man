import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;

  static double screenHeight; //Total Height of the Screen
  static double screenWidth; //Total Width of the Screen

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;

  static double
      safeHeight; //Excludes System Status Bar and Navigation bar Height
  static double safeWidth; //Excludes any System horizontal padding

  //Use these for height
  static double
      usableHeight; //Excludes AppBar and Bottom navigation bar height from safeHeight
  // static double usableHeightOutHome;      //Excludes AppBar height from safeHeight

  void init(BuildContext context) {
    double appBarHeight = AppBar().preferredSize.height;
    _mediaQueryData = MediaQuery.of(context);

    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

    safeHeight = screenHeight - _safeAreaVertical;
    safeWidth = screenWidth - _safeAreaHorizontal;

    usableHeight =
        safeHeight - appBarHeight; //!  55-Height of the bottom navigation bar
    // usableHeightOutHome=safeHeight-appBarHeight;
  }
}
