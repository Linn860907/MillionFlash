import 'package:flutter/material.dart';
import 'package:millionflashapp/helpers/commons.dart';
import 'package:millionflashapp/helpers/order.dart';
import 'package:millionflashapp/models/cart_item.dart';
import 'package:millionflashapp/models/products.dart';
import 'package:millionflashapp/providers/app.dart';
import 'package:millionflashapp/providers/user.dart';
import 'package:millionflashapp/widgets/custom_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:millionflashapp/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';


class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _key = GlobalKey<ScaffoldState>();
  OrderServices _orderServices = OrderServices();

  // double getTotalPrice(List<CartItemModel> cartItems) {
  //   double totalPrice = 0.0;
  //   for (var item in cartItems) {
  //     totalPrice += item.price * item.quantity;
  //   }
  //   return totalPrice;
  // }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final app = Provider.of<AppProvider>(context);



    return Scaffold(
      key: _key,
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        elevation: 0.0,
        title: CustomText(text: "Shopping Cart", size: 20, color: black, weight: FontWeight.bold, decoration: TextDecoration.none,),
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      backgroundColor: white,
      body: app.isLoading ? Loading() : ListView.builder(
          itemCount: user.userModel.cart.length,
          itemBuilder: (_, index) {

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: red.withOpacity(0.2),
                          offset: Offset(3, 2),
                          blurRadius: 30)
                    ]),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                      child: Image.network(
                        user.userModel.cart[index].image,
                        height: 120,
                        width: 140,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: user.userModel.cart[index].name+ "\n",
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: "${user.userModel.cart[index].price} \n\n",
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300)),
                              TextSpan(
                                  text: "Quantity: ",
                                  style: TextStyle(
                                      color: grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                              TextSpan(
                                  text: user.userModel.cart[index].quantity.toString(),
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                            ]),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: red,
                              ),
                              onPressed: ()async{
                                app.ChangeLoading();
                                bool value = await user.removeFromCart(cartItem: user.userModel.cart[index]);
                                if(value){
                                  user.reloadUserModel();
                                  print("Item added to cart");
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Removed from Cart!"))
                                  );
                                  app.ChangeLoading();
                                  return;
                                }else{
                                  print("ITEM WAS NOT REMOVED");
                                  app.ChangeLoading();
                                }
                              })
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
      bottomNavigationBar: Container(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Total: ",
                      style: TextStyle(
                          color: grey,
                          fontSize: 22,
                          fontWeight: FontWeight.w400)),
                  TextSpan(
                      text: " ${user.userModel.totalCartPrice}",
                      style: TextStyle(
                          color: black,
                          fontSize: 22,
                          fontWeight: FontWeight.normal)),
                ]),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: black),
                child: TextButton(
                    onPressed: () {
                      if(user.userModel.totalCartPrice == 0){
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0)), //this right here
                                child: Container(
                                  height: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text('Your cart is emty', textAlign: TextAlign.center,),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                        return;
                      }
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(20.0)), //this right here
                              child: Container(
                                height: 200,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('You will be charged {user.userModel.totalCartPrice} upon delivery!', textAlign: TextAlign.center,),

                                      SizedBox(
                                        width: 320.0,
                                        child: ElevatedButton(
                                          onPressed: () async{
                                            var uuid = Uuid();
                                            String id = uuid.v4();
                                            _orderServices.createOrder(
                                              userId: user.user!.uid,
                                              id: id,
                                              // description: "Some random description",
                                              status: "complete",
                                              totalPrice: user.userModel.totalCartPrice,
                                              cart: user.userModel.cart, 
                                            );
                                            for(CartItemModel cartItem in user.userModel.cart){
                                              bool value = await user.removeFromCart(cartItem: cartItem);
                                              if(value){
                                                user.reloadUserModel();
                                                print("Item added to cart");
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(content: Text("Removed from Cart!"))
                                                );
                                              }else{
                                                print("ITEM WAS NOT REMOVED");
                                              }
                                            }
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text("Order created!"))
                                            );
                                            Navigator.pop(context);

                                          },
                                          child: Text(
                                            "Accept",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          // color: const Color(0xFF1BC0C5),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 320.0,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Reject",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          // color: red
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: CustomText(
                      text: "Check out",
                      size: 20,
                      color: white,
                      weight: FontWeight.normal, decoration: TextDecoration.none,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class CartScreen extends StatefulWidget {
//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   final _key = GlobalKey<ScaffoldState>();
//   OrderServices _orderServices = OrderServices();
//   Product product = Product(name: "Cutting Leather Skirt BU", sname: "MillionFlash™ 23Spring/Summer 'Cutting Leather Skirt'", image: "1.jpg", old_price: '1,980', price: '1,188', wishList: true);
//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<UserProvider>(context);
//     final app = Provider.of<AppProvider>(context);
    
//     return Scaffold(
//       key: _key,
//       appBar: AppBar(
//           iconTheme: IconThemeData(color: black),
//           leading: IconButton(
//             icon: Icon(Icons.close),
//             onPressed: (){
//               Navigator.pop(context);
//               }),
//           backgroundColor: white,
//           elevation: 0.0,
//           centerTitle: true,
//           title: CustomText(
//               text: "Shopping Cart",
//               size: 20,
//               color: black,
//               weight: FontWeight.bold,
//               decoration: TextDecoration.none),
//           // actions: <Widget>[
//           //       Stack(
//           //         children: [
//           //           Padding(
//           //             padding: const EdgeInsets.all(8.0),
//           //             child: Stack(
//           //               children: [
//           //                 Image.asset('assets/category/shoppingcart.png',width: 30, height: 30,),
//           //                 Positioned(
//           //                   right:3,
//           //                   child: Container(decoration: BoxDecoration(
//           //                     color: white,
//           //                     borderRadius: BorderRadius.circular(10),
//           //                     boxShadow: [
//           //                       BoxShadow(
//           //                         color: grey,
//           //                         offset: Offset(2, 1),
//           //                         blurRadius: 2
//           //                       )
//           //                     ]
//           //                   ),
//           //                   child: Padding(padding: const EdgeInsets.only(right:4,left: 4),
//           //                   child: CustomText(text: '2', color: red, size: 12, weight: FontWeight.bold, decoration: TextDecoration.none,),),
//           //                   ),
//           //                 )
//           //               ],
//           //             ),
//           //           ),
//           //         ],
//           //       ),            
//           // ]
//           ),
//       backgroundColor: white,
//       body: ListView(children: <Widget>[
//         Padding(padding: const EdgeInsets.all(10),
//         child: Container(
//           height:160,
//           decoration: BoxDecoration(color: white,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: [
//             BoxShadow(
//               color:grey,
//             offset: Offset(3,7),
//             blurRadius: 15
//             )
//           ]
//         ),
//         child:Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Image.asset('assets/items/${product.image}',height: 150,width: 150,),
//             RichText(text: TextSpan(children: [
//               TextSpan(text: product.name+"\n", style: TextStyle(color: black, fontSize: 15, fontWeight: FontWeight.bold,)),
//               TextSpan(text:"NT "+product.price.toString(), style: TextStyle(color: black, fontSize: 15, fontWeight: FontWeight.bold,)),   
//             ])),
//             IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: grey,))
//           ],
//         ),
//         )
//         )
//       ])
//     );
//   }
// }