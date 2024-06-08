import 'package:flutter/material.dart';
import 'package:millionflashapp/helpers/commons.dart';
import 'package:millionflashapp/widgets/custom_text.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body:SafeArea(
        child: ListView(
          children:<Widget>[
            Container(
              height:200,
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (_, index){
                return Padding(padding: EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: 80,
                  decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        color: grey,
                        offset: Offset(1.0, 1.0),
                        blurRadius: 4
                      )
                    ]
                  ),
                  child: Column(
                    children: <Widget>[
                      Image.asset("assets/items/1.jpeg", height: 140,width: 140,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(padding: const EdgeInsets.all(8.0),
                          child: CustomText(text: "Cutting Leather Skirt BU", size: 14, color: black, weight: FontWeight.normal,decoration: TextDecoration.none,),),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Container(
                               child: Padding(padding: const EdgeInsets.all(8.0),
                                                         child: Icon(Icons.shopping_cart,color:red, size: 18.0),),
                             ),
                           )
                        ]
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: CustomText(text: '4.7', size: 14, color: grey, weight: FontWeight.normal,decoration: TextDecoration.none,),
                              ),
                            ],
                          ),
                          CustomText(text: "2000", size: 14, color: black, weight: FontWeight.normal,decoration: TextDecoration.none,),
                        ],
                      )
                    ],
                  ),
                ),);
              },)
            )
          ]
        ),
      ),
    );
  }
}