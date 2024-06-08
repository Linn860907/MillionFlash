import 'package:flutter/material.dart';
import 'package:millionflashapp/helpers/commons.dart';
import 'package:millionflashapp/models/products.dart';
import 'package:millionflashapp/widgets/custom_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ShoppingCart extends StatefulWidget {
  @override
  State<ShoppingCart> createState() => _CartState();
}

class _CartState extends State<ShoppingCart> {
  Product product = Product(name: "Cutting Leather Skirt BU", sname: "MillionFlash™ 23Spring/Summer 'Cutting Leather Skirt'", image: "1.jpg", old_price: '1,980', price: '1,188', wishList: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: black),
          leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){Navigator.pop(context);},),
          backgroundColor: white,
          elevation: 0.0,
          centerTitle: true,
          title: CustomText(
              text: "Shopping Cart",
              size: 20,
              color: black,
              weight: FontWeight.bold,
              decoration: TextDecoration.none),
          actions: <Widget>[
                Stack(
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
          ]),
      backgroundColor: white,
      body: ListView(children: <Widget>[
        Padding(padding: const EdgeInsets.all(10),
        child: Container(
          height:160,
          decoration: BoxDecoration(color: white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color:grey,
            offset: Offset(3,7),
            blurRadius: 15
            )
          ]
        ),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset('assets/items/${product.image}',height: 150,width: 150,),
            RichText(text: TextSpan(children: [
              TextSpan(text: product.name+"\n", style: TextStyle(color: black, fontSize: 15, fontWeight: FontWeight.bold,)),
              TextSpan(text:"NT "+product.price.toString(), style: TextStyle(color: black, fontSize: 15, fontWeight: FontWeight.bold,)),   
            ])),
            IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: grey,))
          ],
        ),
        )
        )
      ])
    );
  }
}
