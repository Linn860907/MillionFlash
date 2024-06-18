import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:millionflashapp/helpers/screen_navigation.dart';
import 'package:millionflashapp/models/items.dart';
import 'package:millionflashapp/models/products.dart';
import 'package:millionflashapp/providers/app.dart';
import 'package:millionflashapp/providers/items.dart';
import 'package:millionflashapp/providers/products.dart';
import 'package:millionflashapp/providers/user.dart';
import 'package:millionflashapp/screens/cart.dart';
import 'package:millionflashapp/widgets/CarouselWithDotsPage.dart';
import 'package:millionflashapp/widgets/EnlargeStrategy.dart';
import 'package:millionflashapp/widgets/custom_text.dart';
import 'package:millionflashapp/widgets/featured_products.dart';
import 'package:millionflashapp/widgets/loading.dart';
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
  int quantity = 1;
  final _key = GlobalKey<ScaffoldState>();
  @override
  
  Widget build(BuildContext context) {
    // final productProvider = Provider.of<ProductProvider>(context);
    final itemsProvider = Provider.of<ItemsProvider>(context);
    final user = Provider.of<UserProvider>(context);
    final app = Provider.of<AppProvider>(context);
    return Scaffold(
      key: _key,
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
                          IconButton(icon: Icon(Icons.shopping_cart),onPressed: (){
                            changeScreen(context, CartScreen());
                          })
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
                      CustomText(text:'NT ${widget.items.price}', size: 20, color: red, weight: FontWeight.bold, decoration: TextDecoration.none, ),
                      CustomText(text:'NT ${widget.items.oldprice}', size: 14, color: grey, weight: FontWeight.normal, decoration: TextDecoration.lineThrough,),
                  
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
        SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(icon: Icon(Icons.remove,size: 36,), onPressed: (){
                    if(quantity != 1){
                      setState(() {
                        quantity -= 1;
                      });
                    }
                  }),
                ),

                GestureDetector(
                  onTap: ()async{
                    app.ChangeLoading();
                    print("All set loading");

                   bool value =  await user.addToCart(item: widget.items, quantity: quantity,);
                   if(value){
                     print("Item added to cart");
                     ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(content: Text("Added ro Cart!"))
                     );
                     user.reloadUserModel();
                     app.ChangeLoading();
                     return;
                   } else{
                     print("Item NOT added to cart");
                   }
                    print("lOADING SET TO FALSE");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: black,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: app.isLoading ? Loading() : Padding(
                      padding: const EdgeInsets.fromLTRB(28,12,28,12),
                      child: CustomText(text: "Add $quantity To Cart",color: white,size: 22,weight: FontWeight.w300, decoration: TextDecoration.none,),
                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(icon: Icon(Icons.add,size: 36,color: red,), onPressed: (){
                    setState(() {
                      quantity += 1;
                    });
                  }),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}