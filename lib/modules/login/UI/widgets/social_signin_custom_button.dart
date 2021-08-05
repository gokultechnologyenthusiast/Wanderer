import 'package:flutter/material.dart';

class SocialSigninCustomButton extends StatelessWidget {
  const SocialSigninCustomButton({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.buttonText,
    required this.color,
  }) : super(key: key);

  final onTap;
  final IconData icon;
  final String buttonText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              buttonText,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        height: 60,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
