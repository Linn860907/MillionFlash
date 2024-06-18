import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:millionflashapp/helpers/screen_navigation.dart';
import 'package:millionflashapp/helpers/commons.dart';
import 'package:millionflashapp/providers/app.dart';
import 'package:millionflashapp/widgets/bottom_navigationbar.dart';
import 'package:millionflashapp/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:millionflashapp/screens/cart.dart';
import 'package:millionflashapp/widgets/custom_text.dart';
import 'package:millionflashapp/widgets/small_floating_button.dart';
import 'package:millionflashapp/widgets/loading.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  // final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppProvider>(context);
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
                    IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {
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
        body: app.isLoading
            ? Container(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Loading()],
              ))
            : SafeArea(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: [
                      Positioned.fill(
                child: Align(
              alignment: Alignment.center,
              child: Loading(),
            )),
                      BannerCarousel(
                        banners: BannerImages.listBanners,
                        customizedIndicators: const IndicatorModel.animation(
                            width: 20,
                            height: 5,
                            spaceBetween: 2,
                            widthAnimation: 30),
                        height: 400,
                        activeColor: Colors.black,
                        disableColor: Colors.white,
                        animation: true,
                        borderRadius: 10,
                        onTap: (id) => print(id),
                        width: 412,
                        indicatorBottom: false,
                      ),
                    ],
                  ),
                ],
              )),
        bottomNavigationBar: BottomNavBar());
  }
}

class BannerImages {
  static const String banner1 =
      "https://firebasestorage.googleapis.com/v0/b/millionflashshop.appspot.com/o/23-9.jpg?alt=media&token=bcdea1de-19ea-414d-9f08-e3a6b5bf8632";
  static const String banner2 =
      "https://firebasestorage.googleapis.com/v0/b/millionflashshop.appspot.com/o/23-5.jpg?alt=media&token=8c588093-5e66-4004-8e0c-0b6b102192a9";
  static const String banner3 = 
      "https://firebasestorage.googleapis.com/v0/b/millionflashshop.appspot.com/o/23-4.jpg?alt=media&token=73c66fd7-ace5-430b-80d9-09307f2ff9c5";
  static const String banner4 =
      "https://firebasestorage.googleapis.com/v0/b/millionflashshop.appspot.com/o/23-7.jpg?alt=media&token=d067241e-2d61-480b-9c94-005c85d359f5";

  static List<BannerModel> listBanners = [
    BannerModel(imagePath: banner1, id: "1"),
    BannerModel(imagePath: banner2, id: "2"),
    BannerModel(imagePath: banner3, id: "3"),
    BannerModel(imagePath: banner4, id: "4"),
  ];
}

// class Home extends StatefulWidget {
//   const Home({super.key});

//   // final scaffoldKey = GlobalKey<ScaffoldState>();
//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<UserProvider>(context);
//     final app = Provider.of<AppProvider>(context);
//     final categoryProvider = Provider.of<CategoryProvider>(context);
//     final itemsProvider = Provider.of<ItemsProvider>(context);
//     final productProvider = Provider.of<ProductProvider>(context);
//     return Scaffold(
//       // key: scaffoldKey,
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: black),
//         elevation: 0.5,
//         backgroundColor: white,
//         title: Text('MillionFlash'),
//         actions: <Widget>[
//           GestureDetector(
//             onTap: () {
//               changeScreen(context, CartScreen());
//             },
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Stack(
//                 children: [
//                   IconButton(icon:Icon(Icons.shopping_cart),onPressed: (){
//                     changeScreen(context, CartScreen());
//                   }),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       drawer: MyDrawer(),
//       backgroundColor: white,
//       body: app.isLoading ? Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Loading()
//           ],
//         )
//       ) :
//       SafeArea(
//         child: ListView(
//           children: <Widget>[
//           Container(
//               height: 100,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: categoryProvider.categories.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: ()async{
//                       // app.ChangeLoading();
//                       await itemsProvider.loadItemsByCategory(
//                         categoryName: categoryProvider.categories[index].name);
//                         changeScreen(
//                           context, CategoryScreen(
//                             categoryModel: categoryProvider.categories[index]
//                             ));
//                       // app.ChangeLoading();
//                     },
//                     child: CategoryWidget(category: categoryProvider.categories[index]));

//                 },
//               )),
//           // Featured(),
//           Container(
//             height: 600,
//             child: ListView.builder(
//               scrollDirection: Axis.vertical,
//               itemCount: itemsProvider.items.length,
//               itemBuilder: (_, index) {
//                 return GestureDetector(
//                     onTap: ()async{
//                       // app.ChangeLoading();
//                       await itemsProvider.loadItemsByCategory(
//                         categoryName: categoryProvider.categories[index].name);
//                         changeScreen(
//                           context, CategoryScreen(
//                             categoryModel: categoryProvider.categories[index]
//                             ));
//                       // app.ChangeLoading();
//                     },
//                     child: ItemsWidget(items: itemsProvider.items[index]));
//               },
//             )
//           )
//         ]),
//       ),
//       bottomNavigationBar: BottomNavBar()
//     );
//   }
// }
