import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderer/core/controller/sql_database_controller.dart';
import 'package:wanderer/modules/home/controllers/home_page_controller.dart';
import 'package:wanderer/modules/home/models/location_data_model.dart';

import 'home_place_card.dart';

// this is the first card which we see and can be draggable
class DraggableCard extends StatelessWidget {
  const DraggableCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomePageController>();
    return Draggable(
      // this will be whole dragging card
      child: HomePlaceCard(
        key: Key("DraggableCard"),
        color: Colors.green,
        index: 0,
        locationData: controller.locationList[0],
      ),
      feedback: Material(
        type: MaterialType.transparency,
        child: HomePlaceCard(
          color: Colors.green,
          index: 0,
          locationData: controller.locationList[0],
        ),
      ),
      childWhenDragging: Container(),
      onDragEnd: (details) {
        final minimumDrag = 100;
        if (details.offset.dx > minimumDrag) {
          // right swipe
          Get.find<SQLDatabaseController>().addToBookmarkList(
              controller.locationList.removeAt(0) as LocationDataModel);
        } else if (details.offset.dx < -minimumDrag) {
          // left swipe
          controller.locationList.removeAt(0);
        }
      },
    );
  }
}
