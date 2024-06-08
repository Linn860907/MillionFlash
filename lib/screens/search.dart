import 'package:flutter/material.dart';
import 'package:millionflashapp/helpers/screen_navigation.dart';
import 'package:millionflashapp/providers/app.dart';
import 'package:millionflashapp/providers/items.dart';
import 'package:millionflashapp/screens/items_search.dart';
import 'package:millionflashapp/widgets/bottom_navigation_icons.dart';
import 'package:millionflashapp/widgets/bottom_navigationbar.dart';
import 'package:millionflashapp/widgets/categories.dart';
import 'package:millionflashapp/helpers/commons.dart';
import 'package:provider/provider.dart';
import '../providers/category.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final itemsProvider = Provider.of<ItemsProvider>(context);
    return Scaffold(
      // appBar: AppBar(
      //   iconTheme: IconThemeData(color: black),
      //   elevation: 0.5,
      //   backgroundColor: white,
      //   title: Text("Search", style: TextStyle(color: black),),
      //   leading:IconButton(icon: Icon(Icons.close),onPressed: (){Navigator.pop(context);},),
      // ),
      backgroundColor: white,
      body:SafeArea(
        child: ListView(
          children:<Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: grey,
                      offset: Offset(1.0, 1.0),
                      blurRadius: 4
                    )
                  ]
                ),
                child: ListTile(
                  leading: Icon(Icons.search),
                  title: TextField(
                    textInputAction: TextInputAction.search,
                    onSubmitted: (pattern) async{
                      // app.ChangeLoading();
                      await itemsProvider.search(itemsName: pattern);
                      changeScreen(context, ItemSearchScreen());
                    },
                    decoration: InputDecoration(
                      hintText: 'Find Something',
                      border: InputBorder.none
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 5,
            ),

            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryProvider.categories.length,
                itemBuilder: (context, index) {
                  return CategoryWidget(category: categoryProvider.categories[index]);
                },
              )),
          ]
        ),
      ),
      bottomNavigationBar: BottomNavBar()
    );
  }
}