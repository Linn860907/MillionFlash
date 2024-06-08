import 'package:flutter/material.dart';
import 'package:millionflashapp/helpers/commons.dart';
import 'package:millionflashapp/helpers/screen_navigation.dart';
import 'package:millionflashapp/providers/items.dart';
import 'package:millionflashapp/screens/detail.dart';
import 'package:millionflashapp/widgets/bottom_navigationbar.dart';
import 'package:millionflashapp/widgets/custom_text.dart';
import 'package:millionflashapp/widgets/items.dart';
import 'package:provider/provider.dart';
import '../models/category.dart';
import '../widgets/loading.dart';
import '../widgets/featured_products.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoryScreen extends StatelessWidget {

    final CategoryModel categoryModel;

  const CategoryScreen({super.key, required this.categoryModel});
 
  @override
  Widget build(BuildContext context) {

    final itemsProvider = Provider.of<ItemsProvider>(context);

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
        title: CustomText(text: categoryModel.name, size: 20, color: black, weight: FontWeight.bold, decoration: TextDecoration.none,),
        centerTitle: true,
      ),
      
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(
              children: itemsProvider.itemsByCategory.map((item) => GestureDetector(
                onTap:() {
                  changeScreen(context, Details(items: item));
                },
                child: ItemsWidget(
                  items: item
                ),
              ))
              .toList()
            )
          ],
      )),
      bottomNavigationBar: BottomNavBar()
    );
  }
}