import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:millionflashapp/models/items.dart';
import 'package:millionflashapp/models/products.dart';
import 'package:millionflashapp/providers/items.dart';
import 'package:millionflashapp/providers/products.dart';
import 'package:millionflashapp/widgets/CarouselWithDotsPage.dart';
import 'package:millionflashapp/widgets/EnlargeStrategy.dart';
import 'package:millionflashapp/widgets/custom_text.dart';
import 'package:millionflashapp/widgets/featured_products.dart';
import 'package:provider/provider.dart';
import '../helpers/commons.dart';
import '../widgets/EnlargeStrategy.dart';
import 'package:cached_network_image/cached_network_image.dart';



class Details extends StatefulWidget {
  
  // final ProductModel product;
  // Details({super.key, required this.product});

  final ItemModel items;
  const Details({super.key, required this.items});
  @override
  State<Details> createState() => _DetailsState();
}
PageController _pageController = PageController(viewportFraction: 0.8,initialPage: 1);


class _DetailsState extends State<Details> {
  @override
  
  Widget build(BuildContext context) {
    // final productProvider = Provider.of<ProductProvider>(context);
    final itemsProvider = Provider.of<ItemsProvider>(context);

    return Scaffold(
      backgroundColor: white,
      body:SafeArea(
        child:Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton( icon: Icon(Icons.arrow_back_ios),onPressed: (){Navigator.pop(context);},),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Image.asset('assets/category/shoppingcart.png',width: 30, height: 30,),
                          Positioned(
                            right:3,
                            child: Container(decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: grey,
                                  offset: Offset(2, 1),
                                  blurRadius: 2
                                )
                              ]
                            ),
                            child: Padding(padding: const EdgeInsets.only(right:4,left: 4),
                            child: CustomText(text: '2', color: red, size: 12, weight: FontWeight.bold, decoration: TextDecoration.none,),),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        CarouselWithDotsPage(itemslist: itemsProvider.items, category: widget.items.category,),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: widget.items.name, size: 20, color: black, weight: FontWeight.bold, decoration: TextDecoration.none, ),  
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CustomText(text: 'NT ' + widget.items.price.toString(), size: 20, color: red, weight: FontWeight.bold, decoration: TextDecoration.none, ),
                      CustomText(text: 'NT ' + widget.items.oldprice.toString(), size: 14, color: grey, weight: FontWeight.normal, decoration: TextDecoration.lineThrough,),
                  
                    ],
                  ),
                ),
                
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: widget.items.sname, size: 14, color: grey, weight: FontWeight.normal, decoration: TextDecoration.none,),

              ],
            ),  
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){},
                child: Container(
                  decoration: BoxDecoration(

                    color:black,
                  ),
                  child:Padding(padding: const EdgeInsets.fromLTRB(100, 10, 100, 10),
                  child: CustomText(text: 'Add To Cart', size: 20, color: white, weight: FontWeight.bold, decoration: TextDecoration.none, ),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Icon(Icons.favorite_border, color: red),
            ),
                            
          ],
        )
      ],
    )
      ),
    );
  }
}
