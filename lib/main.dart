import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderer/core/routes/binging/initial_binding.dart';
import 'package:wanderer/core/routes/routes.dart';
import 'package:wanderer/core/controller/auth_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      title: "Wanderer",
      theme: ThemeData(
        primaryColor: Color(0xFFF7C377),
        scaffoldBackgroundColor: Color(0xFFF7C377),
      ),
      initialRoute: RouteNamesConstants.splashPageRoute,
      getPages: Routes.routes, // all routes in this app
    );
  }
}
