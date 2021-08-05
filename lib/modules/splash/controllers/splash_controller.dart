import 'package:get/get.dart';
import 'package:wanderer/core/controller/auth_controller.dart';
import 'package:wanderer/core/routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    // this is where we navigate according to log in status
    if (Get.find<AuthController>().isLoggedIn) {
      Get.offAllNamed(RouteNamesConstants.homePageRoute);
    } else {
      Get.offAllNamed(RouteNamesConstants.loginPageRoute);
    }
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
