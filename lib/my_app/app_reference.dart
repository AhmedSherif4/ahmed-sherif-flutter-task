import 'dart:io';

import 'package:flutter/material.dart';

class AppReference {
  AppReference._();

  static final AppReference _instance = AppReference._();

  static AppReference get instance => _instance;

  static late bool deviceIsAndroid;
  static bool deviceIsTablet = false;
  static late bool deviceIsIos;

  static Orientation currentOrientation(context) =>
      MediaQuery.of(context).orientation;

  static bool isPortrait(context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;

  static double deviceHeight(context) => MediaQuery.sizeOf(context).height;

  static double deviceWidth(context) => MediaQuery.sizeOf(context).width;

  static void getDeviceInfo(BuildContext context) {
    final sizeMediaQuery = MediaQuery.sizeOf(context);

    deviceIsAndroid = Platform.isAndroid;

    deviceIsIos = Platform.isIOS;
    final double devicePixelRatio = sizeMediaQuery.shortestSide;
    if (devicePixelRatio < 550) {
      deviceIsTablet = false;
    } else {
      deviceIsTablet = true;
    }
  }
}
