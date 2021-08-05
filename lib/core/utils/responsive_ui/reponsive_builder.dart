import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'device_screen_type.dart';
import 'sizing_information.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
      BuildContext context, SizingInformation sizingInformation) builder;

  ResponsiveBuilder({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        var sizingInformation = SizingInformation(
          orientation: mediaQuery.orientation, // current orientation of device
          deviceScreenType: getDeviceType(mediaQuery), // current device type
          screenSize: mediaQuery.size, // current device screen syze
          localWidgetSize: Size(constraints.maxWidth,
              constraints.maxHeight), // current parent widget size
          benchMarkSize: getMinHeightWidthForWeb(
            // current device type min
            // size
            getDeviceType(mediaQuery),
          ),
          breakPoint: getBreakPointsWidth(
            // current break point width
            getDeviceType(mediaQuery),
            mediaQuery,
          ),
          scaleFactorHeight: getScaleFactorHeight(
            //Height of the component
            // will be based on scale factor
            getDeviceType(mediaQuery),
            mediaQuery,
            getMinHeightWidthForWeb(
              getDeviceType(mediaQuery),
            ),
          ),
          scaleFactorWidth: getScaleFactorWidth(
            //Width of the component
            // will be based on scale factor
            getDeviceType(mediaQuery),
            mediaQuery,
            getMinHeightWidthForWeb(
              getDeviceType(mediaQuery),
            ),
          ),
          isMobile: getDeviceType(mediaQuery) == DeviceScreenType.MOBILE
              ? true
              : false, // if the current device mobile
          isTablet: getDeviceType(mediaQuery) == DeviceScreenType.TABLET
              ? true
              : false, // if the current device tablet
          isDeskTop: getDeviceType(mediaQuery) == DeviceScreenType.DESKTOP
              ? true
              : false, // if the current device desktop
          isWeb: kIsWeb ? true : false, // if the current device web
        );
        return builder(context, sizingInformation);
      },
    );
  }
}
