import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  static const ID = 'id';
  static const NAME = 'name';
  static const IMAGE = 'image';
  static const PRICE = 'price';
  static const OLDPRICE = 'oldprice';
  static const SNAME = 'sname';
  static const WISHLIST = 'wishlist'; 
  static const CATEGORY = 'category';
  static const FEATURED = 'featured';
  static const ITEMSID = 'itemsid';

  late int _id;
  late String _name;
  late String _image;
  late String _price;
  late String _oldprice;
  late String _sname;
  late bool _wishlist;
  late String _category;
  late bool _featured;
  late int _itemsId;

  int get id => _id;
  String get name => _name;
  String get image => _image;
  String get price => _price;
  String get oldprice => _oldprice;
  String get sname => _sname;
  bool get wishlist => _wishlist;
  String get category => _category;
  bool get featured => _featured;
  int get itemsId => _itemsId;

  ItemModel.fromsnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    if (data != null) {
      _id = data[ID] ?? '';
      _name = data[NAME] ?? '';
      _image = data[IMAGE] ?? '';
      _price = data[PRICE] ?? '';
      _oldprice = data[OLDPRICE] ?? '';
      _sname = data[SNAME] ?? '';
      _wishlist = data[WISHLIST] ?? false;
      _category = data[CATEGORY] ?? '';
      _featured = data[FEATURED] ?? false;
      _itemsId = data[ITEMSID] ?? 0;
    } else {
      _id = 0;
      _name = '';
      _image = '';
      _price = '';
      _oldprice = '';
      _sname = '';
      _wishlist = false;
      _category = '';
      _featured = false;
      _itemsId = 0;
    }
  }


}