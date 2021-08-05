import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum DeviceScreenType {
  MOBILE,
  TABLET,
  DESKTOP,
}

Size getMinHeightWidthForWeb(DeviceScreenType deviceScreenType) {
  if (deviceScreenType == DeviceScreenType.DESKTOP) {
    return Size(1199, 1080);
  }

  if (deviceScreenType == DeviceScreenType.TABLET) {
    return Size(768, 1024);
  }

  return Size(375, 812);
}

double getBreakPointsWidth(
    DeviceScreenType deviceScreenType, MediaQueryData mediaQuery) {
  if (deviceScreenType == DeviceScreenType.DESKTOP) {
    return 1199;
  }

  if (deviceScreenType == DeviceScreenType.TABLET) {
    return 768;
  }

  return mediaQuery.size.width;
}

double getScaleFactorHeight(DeviceScreenType deviceScreenType,
    MediaQueryData mediaQuery, Size breakPointSize) {
  //Height of the component will be based on scale factor
  if (kIsWeb) {
    if (mediaQuery.size.height < 600) {
      return 600 / breakPointSize.height;
    }
    return mediaQuery.size.height / breakPointSize.height;
  }
  return mediaQuery.size.height / breakPointSize.height;
}

double getScaleFactorWidth(DeviceScreenType deviceScreenType,
    MediaQueryData mediaQuery, Size breakPointSize) {
  //width of the component will be based on scale factor
  return mediaQuery.size.width / breakPointSize.width;
}

DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  /// fixed device width according to orientation
  double deviceWidth = mediaQuery.size.shortestSide;

  if (kIsWeb) {
    if (mediaQuery.size.width > 1199) {
      return DeviceScreenType.DESKTOP;
    }

    if (mediaQuery.size.width > 768) {
      return DeviceScreenType.TABLET;
    }

    return DeviceScreenType.MOBILE;
  } else {
    if (deviceWidth > 1199) {
      return DeviceScreenType.DESKTOP;
    }

    if (deviceWidth > 768) {
      return DeviceScreenType.TABLET;
    }

    return DeviceScreenType.MOBILE;
  }
}
