import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wanderer/core/controller/internet_connectivity_controller.dart';
import 'package:wanderer/core/controller/sql_database_controller.dart';
import 'package:wanderer/core/utils/enums/api_call_status_enum.dart';

class FavoritePageController extends GetxController {
  // final _obj = ''.obs;
  // set obj(value) => _obj.value = value;
  // get obj => _obj.value;

  RxList favoriteLocationList = [].obs;
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.loading.obs;

  @override
  void onReady() {
    getFavouriteLocationList();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  getFavouriteLocationList() async {
    var list = await Get.find<SQLDatabaseController>().getFavoritePlaceList();
    favoriteLocationList.addAll(list);
    debugPrint("Favorite List count :- ${favoriteLocationList.length}");
    apiCallStatus.value = ApiCallStatus.success;
  }
}
