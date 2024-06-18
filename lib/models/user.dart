import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:millionflashapp/models/cart_item.dart';

class UserModel {
  static const NAME = 'name';
  static const EMAIL = 'email';
  static const ID = 'id';
  static const STRIPE_ID = 'stripe_id';
  static const CART = "cart";

  late String _name;
  late String _email;
  late String _id;
  late String _stripeId;
  late int _priceSum;
  late int _quantitySum;


  // getters
  String get name => _name;
  String get email => _email;
  String get id => _id;
  String get stripeId => _stripeId;

  // public variable
  late List<CartItemModel> cart;
  late int totalCartPrice;

  UserModel.fromsnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    if (data != null) {
      _name = data[NAME] ?? '';
      _email = data[EMAIL] ?? '';
      _id = data[ID] ?? '';
      _stripeId = data[STRIPE_ID] ?? '';
      cart = _convertCartItems(data[CART] ?? []);
      // totalCartPrice = getTotalPrice(cart: cart);
      totalCartPrice = data[CART] == null ? 0 :getTotalPrice(cart: data[CART]);
      
    } else {
      _name = '';
      _email = '';
      _id = '';
      _stripeId = '';
      cart = [];
      totalCartPrice = 0;
    }
    _priceSum = 0;
    _quantitySum = 0;
  }

  int getTotalPrice({required List cart}) {
    if (cart.isEmpty) {
      return 0;
    }
    _priceSum = 0; // Reset _priceSum before calculation
    for (Map cartItem in cart) {
      _priceSum += (cartItem["price"] as int) * (cartItem["quantity"] as int);
    }

    int total = _priceSum;

    print("THE TOTAL IS $total");
    print("THE TOTAL IS $total");
    print("THE TOTAL IS $total");
    print("THE TOTAL IS $total");
    print("THE TOTAL IS $total");

    return total;
  }


  List<CartItemModel> _convertCartItems(List cart){
    List<CartItemModel> convertedCart = [];
    for(Map cartItem in cart){
      convertedCart.add(CartItemModel.fromMap(cartItem));
    }
    return convertedCart;
  }
}
