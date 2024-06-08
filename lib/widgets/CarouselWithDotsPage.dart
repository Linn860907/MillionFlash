import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:millionflashapp/models/items.dart';
import 'package:millionflashapp/models/products.dart';
import 'package:millionflashapp/providers/items.dart';
import 'package:millionflashapp/widgets/featured_products.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CarouselWithDotsPage extends StatefulWidget {

  // final List<ProductModel> productslist;
  // CarouselWithDotsPage({required this.productslist});

  final List<ItemModel> itemslist;
  final String category;

  CarouselWithDotsPage({required this.itemslist, required this.category});

  @override
  _CarouselWithDotsPageState createState() => _CarouselWithDotsPageState();
}

class _CarouselWithDotsPageState extends State<CarouselWithDotsPage> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final filteredItems = widget.itemslist.where((item) => item.category == widget.category).toList();
    // final List<Widget> imageSliders = widget.productslist.map((item) {
      final List<Widget> imageSliders = filteredItems.map((item) {
      return Container(
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
          child: Stack(
            children: [
              Image.network(
                item.image,
                fit: BoxFit.cover,
                height: 1500,
                width: 1000,
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    // gradient: LinearGradient(
                    //   colors: [
                    //     Color.fromARGB(200, 0, 0, 0),
                    //     Color.fromARGB(0, 0, 0, 0),
                    //   ],
                    //   begin: Alignment.bottomCenter,
                    //   end: Alignment.topCenter,
                    // ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  // child: Text(
                  //   item.name,
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 20.0,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: filteredItems.asMap().entries.map((entry) {
              int index = entry.key;
              return Container(
                width: 8,
                height: 8,
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 3,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
