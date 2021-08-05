// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wanderer/core/controller/internet_connectivity_controller.dart';
import 'package:wanderer/core/routes/page_exports.dart';

import 'package:wanderer/modules/home/controllers/home_page_controller.dart';
import 'package:wanderer/modules/home/models/location_data_model.dart';
import 'package:wanderer/modules/home/repositories/location_fetch_repository.dart';

import '../home_controller_unit_test.mocks.dart';

@GenerateMocks([GetLocationListRepository])
void main() {
  var getLocationListRepository = MockGetLocationListRepository();
  List<LocationDataModel> emptyList = [];
  final noPlaceText = find.byKey(
    ValueKey("NoPlaceText"),
  );

  setUp(() {
    Get.put(InternetConnectivityController());
    Get.put(HomePageController());
  });

  group("On launch app", () {
    testWidgets(' should see app bar', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        GetMaterialApp(
          home: HomePage(),
        ),
      );

      // Verify that our counter starts at 0.
      expect(find.text('Wanderer'), findsOneWidget);
    });

    testWidgets('On launch app then circular progress is shown',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        GetMaterialApp(
          home: HomePage(),
        ),
      );

      await tester.pump();

      expect(
          find.byKey(
            ValueKey("HomeCircularProgressBar"),
          ),
          findsOneWidget);
    });

    testWidgets('On launch app when api complete should show no data',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        GetMaterialApp(
          home: HomePage(),
        ),
      );

      final controller = Get.find<HomePageController>();
      when(controller.getLocationList(getLocationListRepository))
          .thenAnswer((realInvocation) => Future.value(emptyList));
      await controller.getLocationList(getLocationListRepository);
      verify(controller.getLocationList(getLocationListRepository));

      await tester.pump();

      expect(noPlaceText, findsOneWidget);
    });

    testWidgets('On launch app when api complete should show card',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        GetMaterialApp(
          home: HomePage(),
        ),
      );

      final controller = Get.find<HomePageController>();
      when(controller.getLocationList(getLocationListRepository))
          .thenAnswer((realInvocation) => Future.value([
                LocationDataModel(
                    country: "India",
                    name: "hi",
                    asciiName: "hi",
                    countryDigraph: "Hi",
                    googleMapsLink: "Hi",
                    id: 0,
                    state: "Hi",
                    wikipediaLink: "Hi")
              ]));
      await controller.getLocationList(getLocationListRepository);
      verify(controller.getLocationList(getLocationListRepository));
    });
  });
}
