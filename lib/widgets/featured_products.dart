import 'package:flutter/material.dart';
import 'package:millionflashapp/helpers/screen_navigation.dart';
import 'package:millionflashapp/models/products.dart';
import 'package:millionflashapp/helpers/commons.dart';
import 'package:millionflashapp/providers/products.dart';
import 'package:millionflashapp/screens/detail.dart';
import 'package:millionflashapp/widgets/custom_text.dart';
import 'package:millionflashapp/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

// List<ProductModel> productslist = [];

class Featured extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Container(
              height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: productProvider.products.length,
                  itemBuilder: (_, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        // changeScreen(_, Details(product: productProvider.products[index]));
                        },
                      child: Container(
                        height: 280,
                        width: 250,
                        decoration: BoxDecoration(
                           color: white,
                           boxShadow: [
                             BoxShadow(
                                 color: grey,
                                 offset: Offset(1.0, 1.0),
                                blurRadius: 4
                         )
                      ]),
                      child:Stack(
                        children: [
                          Positioned.fill(child: Align(alignment: Alignment.center,child: Loading(),)),
                          Column(
                          children:<Widget>[
                            Image.network(productProvider.products[index].image, height: 220, width: 250,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: CustomText(text: productProvider.products[index].name, size: 14, color: black, weight: FontWeight.normal, decoration: TextDecoration.none, ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: productProvider.products[index].wishlist ? Icon(Icons.favorite, color:red) : Icon(Icons.favorite_border, color: red),
                                ),
                              ],
                            ),
                            Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: CustomText(text: "\$ ${productProvider.products[index].price}", size: 14, color: red, weight: FontWeight.normal,decoration: TextDecoration.none,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: CustomText(text: "\$ ${productProvider.products[index].oldprice}" , size: 14, color: grey, weight: FontWeight.normal, decoration: TextDecoration.lineThrough,),
                                    )
                                ],)
                          ]
                          ),
                        ],
                      ),
                      ),
                    ),
                  );
                })
            );
  }
}