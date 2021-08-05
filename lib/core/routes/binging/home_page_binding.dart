import 'package:get/get.dart';
import 'package:wanderer/modules/home/controllers/home_page_controller.dart';

// All the controllers for home page is listed here
class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
  }
}
