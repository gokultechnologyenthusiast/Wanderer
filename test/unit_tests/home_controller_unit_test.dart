import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wanderer/modules/home/controllers/home_page_controller.dart';
import 'package:wanderer/modules/home/models/location_data_model.dart';
import 'package:wanderer/modules/home/repositories/location_fetch_repository.dart';

import '../home_controller_unit_test.mocks.dart';

@GenerateMocks([GetLocationListRepository])
void main() {
  var getLocationListRepository = MockGetLocationListRepository();
  setUp(() {
    Get.put(HomePageController());
  });
  test(
      "when home page controller fetch location called should get array with"
      " count 1 and country value India", () async {
    final controller = Get.find<HomePageController>();
    when(controller.getLocationList(getLocationListRepository)).thenAnswer(
        (realInvocation) =>
            Future.value([LocationDataModel(country: "India")]));
    await controller.getLocationList(getLocationListRepository);
    verify(controller.getLocationList(getLocationListRepository));
    expect(controller.locationList.length, 1);
    expect((controller.locationList[0] as LocationDataModel).country, "India");
  });
}
