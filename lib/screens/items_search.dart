import 'package:flutter/material.dart';
import 'package:millionflashapp/helpers/commons.dart';
import 'package:millionflashapp/helpers/screen_navigation.dart';
import 'package:millionflashapp/providers/app.dart';
import 'package:millionflashapp/providers/items.dart';
import 'package:millionflashapp/screens/cart.dart';
import 'package:millionflashapp/screens/detail.dart';
import 'package:millionflashapp/screens/home.dart';
import 'package:millionflashapp/screens/search.dart';
import 'package:millionflashapp/widgets/bottom_navigation_icons.dart';
import 'package:millionflashapp/widgets/bottom_navigationbar.dart';
import 'package:millionflashapp/widgets/custom_text.dart';
import 'package:millionflashapp/widgets/items.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ItemSearchScreen extends StatelessWidget {
  const ItemSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final itemsProvider = Provider.of<ItemsProvider>(context);
    // final app = Provider.of<AppProvider>(context);    
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   iconTheme: IconThemeData(color: Colors.black),
        //   backgroundColor: white,
        //   leading: IconButton(icon: Icon(Icons.close),onPressed: (){Navigator.pop(context);
        //   }),
        //   title: Text("Products"),
        //   actions: <Widget>[
        //     IconButton(icon: Icon(Icons.shopping_cart),onPressed: (){}) 
        //   ],
        // ),
        body: 
        itemsProvider.itemsSearched.length < 1? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon(Icons.search, color: grey, size: 30,),
                // SizedBox(height: 15,),
                CustomText(text: 'No products Found', size: 20, color: grey, weight: FontWeight.bold, decoration: TextDecoration.none,),
              ],
            ),    
          ],) : ListView.builder(
          itemCount: itemsProvider.itemsSearched.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: ()async{
                changeScreen(context, Details(items: itemsProvider.itemsSearched[index]));
              },
              child: ItemsWidget(items: itemsProvider.itemsSearched[index]));
          },),
          bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}