import 'package:cloud_firestore/cloud_firestore.dart';

class CartItemModel{
  static const NAME = 'name';
  static const ID = 'id';
  static const ITEMSID = 'itemsId';
  static const IMAGE = 'image';
  static const QUANTITY = 'quantity';
  static const PRICE = 'price';

  late String _name;
  late int _id;
  late int _itemsId;
  late String _image;
  late int _quantity;
  late int _price;


  String get name => _name;
  int get id => _id;
  int get itemsId => _itemsId;
  String get image => _image;
  int get quantity => _quantity;
  int get price => _price;

  CartItemModel.fromMap(Map data){
    _id = data[ID];
    _name =  data[NAME];
    _image =  data[IMAGE];
    _itemsId = data[ITEMSID];
    _price = data[PRICE];
    _quantity = data[QUANTITY];
  }

  Map<String, dynamic> toMap() => {
    ID: _id,
    IMAGE: _image,
    NAME: _name,
    ITEMSID: _itemsId,
    QUANTITY: _quantity,
    PRICE: _price,
  };
}

  // CartItemModel.fromsnapshot(DocumentSnapshot snapshot) {
  //   Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
  //   if (data != null) {
  //     _id = data[ID] ?? 0;
  //     _name = data[NAME] ?? '';
  //     _itemsId = data[ITEMSID] ?? 0;
  //     _image = data[IMAGE] ?? '';
  //     _price = data[PRICE] ?? 0;
  //     _quantity = data[QUANTITY] ?? 0;
  //   } else {
  //     _id = 0;
  //     _name = '';
  //     _itemsId = 0;
  //     _image = '';
  //     _price = 0;
  //     _quantity = 0;
  //   }
  // }

  // CartItemModel.fromMap(Map<String, dynamic> data) {
  //   _id = data[ID] ?? 0;
  //   _name = data[NAME] ?? '';
  //   _itemsId = data[ITEMSID] ?? 0;
  //   _image = data[IMAGE] ?? '';
  //   _price = data[PRICE] ?? 0;
  //   _quantity = data[QUANTITY] ?? 0;
  // }

  