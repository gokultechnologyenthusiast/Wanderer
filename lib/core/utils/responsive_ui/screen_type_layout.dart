import 'package:flutter/material.dart';

import 'device_screen_type.dart';
import 'reponsive_builder.dart';

class ScreenTypeLayout extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;
  const ScreenTypeLayout({Key? key, this.mobile, this.tablet, this.desktop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.TABLET) {
          if (tablet != null) {
            return tablet!;
          }
          return mobile!;
        }
        if (sizingInformation.deviceScreenType == DeviceScreenType.DESKTOP) {
          if (desktop != null) {
            return desktop!;
          }
          return mobile!;
        }
        return mobile!;
      },
    );
  }
}
