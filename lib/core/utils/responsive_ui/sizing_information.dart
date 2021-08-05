import 'package:flutter/material.dart';

import 'device_screen_type.dart';

class SizingInformation {
  final Orientation? orientation;
  final DeviceScreenType? deviceScreenType;
  final Size? screenSize;
  final Size? localWidgetSize;
  final Size? benchMarkSize;
  final double? breakPoint;
  final bool? isMobile;
  final bool? isTablet;
  final bool? isDeskTop;
  final bool? isWeb;
  final double? scaleFactorHeight;
  final double? scaleFactorWidth;

  SizingInformation({
    this.orientation,
    this.deviceScreenType,
    this.screenSize,
    this.localWidgetSize,
    this.benchMarkSize,
    this.breakPoint,
    this.isMobile,
    this.isTablet,
    this.isDeskTop,
    this.isWeb,
    this.scaleFactorHeight,
    this.scaleFactorWidth,
  });
}
