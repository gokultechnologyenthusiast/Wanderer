import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:wanderer/core/controller/auth_controller.dart';
import 'package:wanderer/core/routes/routes.dart';

import 'widgets/social_signin_custom_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Wanderer",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Sign In with",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SocialSigninCustomButton(
              // facebook sign in button
              icon: FontAwesomeIcons.facebook,
              buttonText: "Sign in with Facebook",
              color: Colors.blueAccent,
              onTap: () async {
                // we sign in with facebook here
                try {
                  var value =
                      await Get.find<AuthController>().signInWithFacebook();
                  debugPrint(
                      "You have signed in as ${value.user!.displayName}");
                  Get.offAllNamed(RouteNamesConstants.homePageRoute);
                } catch (e) {
                  Get.snackbar("Sorry!", e.toString(),
                      snackPosition: SnackPosition.BOTTOM,
                      colorText: Colors.white);
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            SocialSigninCustomButton(
              // google sign in button
              icon: FontAwesomeIcons.google,
              buttonText: "Sign in with Google",
              color: Colors.red,
              onTap: () async {
                // we sign in with google here
                try {
                  var value =
                      await Get.find<AuthController>().signInWithGoogle();
                  debugPrint(
                      "You have signed in as ${value.user!.displayName}");
                  Get.offAllNamed(RouteNamesConstants.homePageRoute);
                } catch (e) {
                  Get.snackbar("Sorry!", e.toString(),
                      snackPosition: SnackPosition.BOTTOM,
                      colorText: Colors.white);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
