import 'package:flutter/material.dart';

// this screen is to check if user is already logged in or not
class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Welcome To",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Wanderer",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
