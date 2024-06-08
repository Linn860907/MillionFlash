import 'package:flutter/material.dart';
import 'package:millionflashapp/helpers/commons.dart';
import 'package:millionflashapp/widgets/custom_text.dart';

class BottomNavIcon extends StatelessWidget {
  final String image;
  final String name;
  final Function onTap;

  const BottomNavIcon({super.key, required this.image, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: onTap as void Function()?,
        child: Column(
          children: [
            Image.asset(
              'assets/category/$image',
              height: 20,
              width: 20,
            ),
            SizedBox(height: 2),
            CustomText(
              text: "$name",
              size: 12,
              color: black,
              weight: FontWeight.normal,
              decoration: TextDecoration.none,
            ),
          ],
        ),
      ),
    );
  }
}
