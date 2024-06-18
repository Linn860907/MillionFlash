import 'package:flutter/material.dart';
import 'package:millionflashapp/helpers/commons.dart';
import 'package:millionflashapp/widgets/custom_text.dart';

class AboutMillionFlash extends StatelessWidget {
  const AboutMillionFlash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        iconTheme: IconThemeData(color: black),
        elevation: 0.5,
        backgroundColor: white,
        title: CustomText(text: "About MillionFlash", size: 20, color: black, weight: FontWeight.bold, decoration: TextDecoration.none,),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 添加照片
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/IMG_8188.jpg', width: 100, height: 100),
          ),
          // 添加文本
          Text(
            '''Millionflash™ is a designer brand,was founded in 2020 by designer Josh Wang.
Creates a new look for clothing through the fusion of new and old from an experimental perspective,
and the studio not only sells its own branch line, but also provides styling customizationand costume rental.

For the brand name, designer Josh wanted to jump out of the traditional way of naming his own name, the early cartoon used light bulbs to interpret ideas and ideas, through this inspiration synonymous with Flash as the idea, the word MillionFlash was born, hoping to present and shine like the light in the sky through many different inspirations and ideas.
-
2020 Taiwan Fashion Design Award / SECOND PRIZE
2022 Taipei TOP Fashion Design Award / SHORTLISTED

Based in Taiwan, New Taipei

Best,
Million Flash™
''',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}