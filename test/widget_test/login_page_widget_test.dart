import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:wanderer/modules/login/UI/login_page.dart';

void main() {
  setUp(() {});

  testWidgets("When login page loads should show Wanderer text",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: LoginPage(),
      ),
    );

    expect(find.text('Wanderer'), findsOneWidget);
    expect(find.text('Sign in with Facebook'), findsOneWidget);
    expect(find.text('Sign in with Google'), findsOneWidget);
  });
}
