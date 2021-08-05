import 'package:flutter/material.dart';

class CardTappableIcons extends StatelessWidget {
  const CardTappableIcons({
    Key? key,
    required this.onTap,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Center(
          child: Image.asset(
            imageUrl,
            height: 35,
            width: 35,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
