import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderer/core/controller/sql_database_controller.dart';
import 'package:wanderer/modules/home/controllers/home_page_controller.dart';
import 'package:wanderer/modules/home/models/location_data_model.dart';

import 'card_tappable_icons.dart';

class TopRightTappableIconGroup extends StatelessWidget {
  const TopRightTappableIconGroup({
    Key? key,
    required this.locationData,
  }) : super(key: key);

  final LocationDataModel locationData;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomePageController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CardTappableIcons(
          // on tap of this icon location
          // will be opened in google map
          imageUrl: "assets/images/pin.png",
          onTap: () => controller.launchUrl(locationData.googleMapsLink!),
        ),
        SizedBox(
          width: 20,
        ),
        CardTappableIcons(
          // on tap of this icon this
          // location will be added to favorites list
          imageUrl: "assets/images/favorite.png",
          onTap: () => Get.find<SQLDatabaseController>().addToFavoriteList(
              controller.locationList.removeAt(0) as LocationDataModel),
        ),
      ],
    );
  }
}
