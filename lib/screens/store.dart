import 'package:flutter/material.dart';
import 'package:millionflashapp/helpers/commons.dart';
import 'package:millionflashapp/helpers/screen_navigation.dart';
import 'package:millionflashapp/providers/app.dart';
import 'package:millionflashapp/providers/category.dart';
import 'package:millionflashapp/providers/items.dart';
import 'package:millionflashapp/screens/cart.dart';
import 'package:millionflashapp/screens/category.dart';
import 'package:millionflashapp/widgets/bottom_navigationbar.dart';
import 'package:millionflashapp/widgets/custom_text.dart';
import 'package:millionflashapp/widgets/drawer.dart';
import 'package:millionflashapp/widgets/items.dart';
import 'package:millionflashapp/widgets/loading.dart';
import 'package:provider/provider.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  
  @override
  Widget build(BuildContext context) {
    final itemsProvider = Provider.of<ItemsProvider>(context);
    final app = Provider.of<AppProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);

    return Scaffold(
 // key: scaffoldKey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        elevation: 0.5,
        backgroundColor: white,
        title: Text('MillionFlash'),
        centerTitle: true,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              changeScreen(context, CartScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  IconButton(icon:Icon(Icons.shopping_cart),onPressed: (){
                    changeScreen(context, CartScreen());
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: MyDrawer(),
      backgroundColor: white,
      body: app.isLoading ? Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Loading()
          ],
        )
      ) :
      SafeArea(
        child: ListView(
          children: <Widget>[
          // Featured(),
          Container(
            height: 600,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: itemsProvider.items.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                    onTap: ()async{
                      // app.ChangeLoading();
                      await itemsProvider.loadItemsByCategory(
                        categoryName: categoryProvider.categories[index].name);
                        changeScreen(
                          context, CategoryScreen(
                            categoryModel: categoryProvider.categories[index]
                            ));
                      // app.ChangeLoading();
                    },
                    child: ItemsWidget(items: itemsProvider.items[index]));
              },
            )
          )
        ]),
      ),
      bottomNavigationBar: BottomNavBar()
    );
  }
}
