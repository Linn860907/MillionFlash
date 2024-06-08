import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:millionflashapp/models/products.dart';

class EnlargeStrategy extends StatefulWidget {
  final List<Product> productslist;

  EnlargeStrategy({required this.productslist});

  @override
  State<EnlargeStrategy> createState() => _EnlargeStrategyState();
}

class _EnlargeStrategyState extends State<EnlargeStrategy> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = widget.productslist.asMap().entries.map((entry) {
      int index = entry.key;
      Product item = entry.value;
      return Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network('assets/items/${item.image}', fit: BoxFit.cover, height: 1000, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      '${entry.value.name}', // or '${entry.value.sname}'
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      );
    }).toList();

    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
        ),
        items: imageSliders,
      ),
    );
  }
}
