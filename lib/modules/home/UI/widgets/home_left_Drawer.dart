import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderer/core/controller/auth_controller.dart';
import 'package:wanderer/core/routes/routes.dart';

class HomeLeftDrawer extends StatelessWidget {
  const HomeLeftDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: Key("Drawer"),
      // this is the left drawer which contains favourites
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 20, top: 60, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                  Get.toNamed(RouteNamesConstants.favoritePageRoute);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      child: Image.asset(
                        "assets/images/favorite.png",
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Favorite Places",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              InkWell(
                  onTap: () {
                    Get.find<AuthController>().logout();
                    Get.offAllNamed(RouteNamesConstants.loginPageRoute);
                  },
                  child: Text(
                    "Log out",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
