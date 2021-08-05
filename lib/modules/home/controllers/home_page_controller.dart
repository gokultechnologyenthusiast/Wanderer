import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wanderer/core/controller/internet_connectivity_controller.dart';
import 'package:wanderer/core/utils/enums/api_call_status_enum.dart';
import 'package:wanderer/modules/home/repositories/location_fetch_repository.dart';

// this is where the business logic of home page exist
class HomePageController extends GetxController {
  // final _obj = ''.obs;
  // set obj(value) => _obj.value = value;
  // get obj => _obj.value;
  RxList locationList = [].obs;
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.loading.obs;

  GetLocationListRepository _getLocationListRepository =
      GetLocationListRepository();

  @override
  void onReady() async {
    ever(Get.find<InternetConnectivityController>().internetConnectivity,
        (value) {
      if (value as bool) {
        // when internet connectivity changes then list should be repopulated
        getLocationList(_getLocationListRepository);
      } else {
        // if no internet then connection error should be shown
        apiCallStatus.value = ApiCallStatus.error;
      }
    });
    ever(locationList, (value) {
      // when ever the value of location list
      // changes this function gets hit.
      var list = value as List<dynamic>;
      debugPrint("count of location list ${list.length}");
      if (list.length == 3) {
        // when ever the length of list becomes 3 then the api is called and
        // list is repopulated
        getLocationList(_getLocationListRepository);
      }
    });
    super.onReady();
  }

  // location list is fetched from api
  getLocationList(GetLocationListRepository getLocationListRepository) async {
    var list = await getLocationListRepository.fetchLocationList();
    locationList.addAll(list);
    apiCallStatus.value = ApiCallStatus.success;
  }

  Future<bool> launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
      return true;
    } else {
      throw 'Could not launch $url';
    }
  }
}
