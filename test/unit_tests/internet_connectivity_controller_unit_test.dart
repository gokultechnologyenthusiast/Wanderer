import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wanderer/core/controller/internet_connectivity_controller.dart';

import '../internet_connectivity_controller_unit_test.mocks.dart';

@GenerateMocks([Connectivity])
void main() {
  var connectivity = MockConnectivity();
  setUp(() {
    Get.put(InternetConnectivityController());
  });

  test(
      "when there is internet connection the isInternet variable should be "
      "true", () async {
    final controller = Get.find<InternetConnectivityController>();

    controller.connectivity = connectivity;

    when(connectivity.checkConnectivity()).thenAnswer(
        (realInvocation) => Future.value(ConnectivityResult.mobile));
    await controller.initConnectivity();
    expect(controller.internetConnectivity.value, true);
  });
}
