import 'package:flutter/material.dart';
import 'package:millionflashapp/helpers/commons.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;
  final TextDecoration decoration;

   CustomText({required this.text, required this.size, required this.color, required this.weight, required this.decoration});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: size ?? 16, color: color ?? black, fontWeight: weight ?? FontWeight.normal, decoration: decoration?? TextDecoration.none),);
  }
}