import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderer/core/utils/enums/api_call_status_enum.dart';
import 'package:wanderer/core/utils/responsive_ui/reponsive_builder.dart';
import 'package:wanderer/modules/home/UI/widgets/draggable_card.dart';
import 'package:wanderer/modules/home/controllers/home_page_controller.dart';

import 'widgets/home_left_Drawer.dart';
import 'widgets/home_place_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // accessing the controller for this page
    final controller = Get.find<HomePageController>();
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        endDrawer: HomeLeftDrawer(),
        appBar: AppBar(
          title: Text(
            "Wanderer",
            style: TextStyle(
                fontSize: sizingInformation.scaleFactorHeight! * 30,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Obx(() {
          switch (controller.apiCallStatus.value) {
            case ApiCallStatus.loading:
              return Center(
                child: CircularProgressIndicator(
                  key: Key("HomeCircularProgressBar"),
                ),
              );
            case ApiCallStatus.error:
              return Center(
                child: Text("No internet connectivity, Please "
                    "check your network!"),
              );
            default:
              return controller.locationList.length != 0
                  ? Center(
                      child: Stack(
                        // 3 cards will there
                        // this is the swiping card stack
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: 10,
                            child: HomePlaceCard(
                              color: Colors.blue,
                              index: 2,
                              locationData: controller.locationList[2],
                            ),
                          ),
                          Positioned(
                            top: 20,
                            child: HomePlaceCard(
                              color: Colors.red,
                              index: 1,
                              locationData: controller.locationList[1],
                            ),
                          ),
                          Positioned(
                            top: 30,
                            child: DraggableCard(),
                          )
                        ],
                      ),
                    )
                  : Center(
                      child: Text(
                        "No places available!",
                        key: Key("NoPlaceText"),
                      ),
                    );
          }
        }),
      ),
    );
  }
}
