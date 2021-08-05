import 'package:get/get.dart';
import 'package:wanderer/modules/favorites/controllers/favorite_page_controller.dart';

class FavoritePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FavoritePageController());
  }
}
