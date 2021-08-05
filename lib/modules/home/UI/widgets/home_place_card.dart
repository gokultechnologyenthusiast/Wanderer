import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanderer/core/utils/responsive_ui/reponsive_builder.dart';
import 'package:wanderer/modules/home/models/location_data_model.dart';

import 'card_country_row.dart';
import 'card_top_tappable_icon_Row.dart';

// this is the view for each cards
class HomePlaceCard extends StatelessWidget {
  final Color color;
  final int index;
  final LocationDataModel locationData;
  const HomePlaceCard({
    Key? key,
    required this.color,
    required this.index,
    required this.locationData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Card(
        elevation: 10,
        color: color,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                // static image is used
                image: AssetImage("assets/images/LocationImage.png"),
                fit: BoxFit.cover),
          ),
          height: sizingInformation.screenSize!.height * 0.6,
          width: (index == 2)
              ? ((sizingInformation.screenSize!.width * 0.8) - 60)
              : (index == 1)
                  ? ((sizingInformation.screenSize!.width * 0.8) - 30)
                  : sizingInformation.screenSize!.width * 0.8,
          child: Stack(
            children: [
              Positioned(
                top: 10,
                right: 10,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TopRightTappableIconGroup(locationData: locationData),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      locationData.name!,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CardCountryRow(locationData: locationData),
                  ],
                ),
              )
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
      ),
    );
  }
}
