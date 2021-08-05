import 'package:get/get.dart';
import 'package:wanderer/core/controller/internet_connectivity_controller.dart';
import 'package:wanderer/core/controller/sql_database_controller.dart';
import 'package:wanderer/core/controller/auth_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.lazyPut(() => InternetConnectivityController(), fenix: true);
    Get.put(SQLDatabaseController());
  }
}
