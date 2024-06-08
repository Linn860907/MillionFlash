import 'package:cloud_firestore/cloud_firestore.dart';

class CartItemModel{
  static const NAME = 'name';
  static const ID = 'id';
  static const PRODUCTID = 'productId';
  static const IMAGE = 'image';
  static const QUANTITY = 'quantity';
  static const PRICE = 'price';

  late String _name;
  late int _id;
  late String _productId;
  late String _image;
  late int _quantity;
  late int _price;


  String get name => _name;
  int get id => _id;
  String get productId => _productId;
  String get image => _image;
  int get quantity => _quantity;
  int get price => _price;

  CartItemModel.fromsnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    if (data != null) {
      _id = data[ID] ?? '';
      _name = data[NAME] ?? '';
      _productId = data[PRODUCTID] ?? '';
      _image = data[IMAGE] ?? '';
      _price = data[PRICE] ?? '';
      _quantity = data[QUANTITY] ?? '';
    } else {
      _id = 0;
      _name = '';
      _productId = '';
      _image = '';
      _price = 0;
      _quantity = 0;
    }
  }
}