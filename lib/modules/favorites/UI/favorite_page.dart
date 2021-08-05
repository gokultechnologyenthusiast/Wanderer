import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderer/core/utils/enums/api_call_status_enum.dart';
import 'package:wanderer/modules/favorites/controllers/favorite_page_controller.dart';
import 'package:wanderer/modules/home/UI/widgets/card_tappable_icons.dart';
import 'package:wanderer/modules/home/controllers/home_page_controller.dart';
import 'package:wanderer/modules/home/models/location_data_model.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<FavoritePageController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: Obx(() {
        switch (controller.apiCallStatus.value) {
          case ApiCallStatus.loading:
            return Center(
              child: CircularProgressIndicator(
                key: Key("FavoriteCircularProgressBar"),
              ),
            );
          case ApiCallStatus.error:
            return Center(
              child: Text("Something went wrong!"),
            );
          default:
            return controller.favoriteLocationList.length != 0
                ? ListView.builder(
                    // the list of favorite locations
                    itemCount: controller.favoriteLocationList.length,
                    itemBuilder: (context, index) => Card(
                      elevation: 10,
                      child: ListTile(
                        title: Text(
                          (controller.favoriteLocationList[index]
                                  as LocationDataModel)
                              .name!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text((controller.favoriteLocationList[index]
                                as LocationDataModel)
                            .country!),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CardTappableIcons(
                                onTap: () async {
                                  try {
                                    var value =
                                        await Get.find<HomePageController>()
                                            .launchUrl((controller
                                                        .favoriteLocationList[
                                                    index] as LocationDataModel)
                                                .wikipediaLink!);
                                  } catch (e) {
                                    Get.snackbar("Sorry!", e.toString(),
                                        snackPosition: SnackPosition.BOTTOM,
                                        colorText: Colors.white);
                                  }
                                },
                                imageUrl: "assets/images/wiki.png"),
                            SizedBox(
                              width: 8,
                            ),
                            CardTappableIcons(
                                onTap: () {
                                  try {
                                    var value = Get.find<HomePageController>()
                                        .launchUrl((controller
                                                    .favoriteLocationList[index]
                                                as LocationDataModel)
                                            .googleMapsLink!);
                                  } catch (e) {
                                    Get.snackbar("Sorry!", e.toString(),
                                        snackPosition: SnackPosition.BOTTOM,
                                        colorText: Colors.white);
                                  }
                                },
                                imageUrl: "assets/images/pin.png"),
                          ],
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: Text(
                      "No favorite places added!",
                      key: Key("NoFavouritePlaceText"),
                    ),
                  );
        }
      }),
    );
  }
}
