import 'package:get/get.dart';
import 'package:wanderer/core/routes/binging/favorite_page_binding.dart';
import 'package:wanderer/core/routes/binging/home_page_binding.dart';
import 'package:wanderer/core/routes/binging/splash_binging.dart';
import 'package:wanderer/modules/favorites/UI/favorite_page.dart';
import 'package:wanderer/modules/login/UI/login_page.dart';
import 'package:wanderer/modules/splash/UI/splash.dart';

import 'page_exports.dart';

part 'route_name_constants.dart';

class Routes {
  static final routes = [
    GetPage(
      name: RouteNamesConstants.splashPageRoute,
      page: () => Splash(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RouteNamesConstants.loginPageRoute,
      page: () => LoginPage(),
    ),
    GetPage(
      name: RouteNamesConstants.homePageRoute,
      page: () => HomePage(),
      binding: HomePageBinding(), // the controller for the specific page is
      // passed here
    ),
    GetPage(
      name: RouteNamesConstants.favoritePageRoute,
      page: () => FavoritePage(),
      binding: FavoritePageBinding(), // the controller for the specific page is
      // passed here
    ),
  ];
}
