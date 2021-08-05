import 'package:flutter/material.dart';

import 'reponsive_builder.dart';

class OrientationLayout extends StatelessWidget {
  final Widget Function(BuildContext context)? landscape;
  final Widget Function(BuildContext context)? portrait;
  const OrientationLayout({Key? key, this.landscape, this.portrait})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ResponsiveBuilder(
          builder: (context, sizingInformation) {
            if (sizingInformation.orientation == Orientation.landscape) {
              if (landscape != null) {
                return landscape!(context);
              }
              return portrait!(context);
            }
            return portrait!(context);
          },
        );
      },
    );
  }
}
