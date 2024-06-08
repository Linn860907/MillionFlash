import 'package:flutter/material.dart';
import 'package:millionflashapp/helpers/commons.dart';
import 'package:millionflashapp/models/lookbook21.dart';
import 'package:millionflashapp/providers/lookbook21.dart';
import 'package:millionflashapp/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Lookbook21 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lookbook21Provider = Provider.of<LookBook21Provider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lookbook 21'),
        centerTitle: true,
      ),
      backgroundColor: white,
      body: SafeArea(
        child: Container(
          child: ListView.builder(
            itemCount: lookbook21Provider.lookbook21.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Center(
                    child: Loading(), // Show loading spinner at the center
                  ),
                  Image.network(
                    lookbook21Provider.lookbook21[index].image,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child; // Image is fully loaded, show the image
                      } else {
                        return Center(
                          child: Loading(), // Show loading spinner while image is loading
                        );
                      }
                    },
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return Center(
                        child: Icon(Icons.error), // Show an error icon if image fails to load
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
