import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  static const ID = 'id';
  static const NAME = 'name';
  static const IMAGE = 'image';
  static const PRICE = 'price';
  static const OLDPRICE = 'oldprice';
  static const SNAME = 'sname';
  static const USER_LIKES = "userLikes"; 
  static const CATEGORY = 'category';
  static const FEATURED = 'featured';
  static const ITEMSID = 'itemsid';
  static const DESCRIPTION = "description";

  late int _id;
  late String _name;
  late String _image;
  late int _price;
  late int _oldprice;
  late String _sname;
  late String _category;
  late bool _featured;
  late int _itemsId;
  late String _description;

  late List<String> _userLikes;

  int get id => _id;
  String get name => _name;
  String get image => _image;
  int get price => _price;
  int get oldprice => _oldprice;
  String get sname => _sname;
  String get category => _category;
  bool get featured => _featured;
  int get itemsId => _itemsId;
  String get description => _description;

  List<String> get userLikes => _userLikes;

  // public variable
  bool liked = false;

  ItemModel.fromsnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    if (data != null) {
      _id = data[ID] ?? '';
      _name = data[NAME] ?? '';
      _image = data[IMAGE] ?? '';
      _price = data[PRICE] ?? '';
      _oldprice = data[OLDPRICE] ?? '';
      _sname = data[SNAME] ?? '';
      _category = data[CATEGORY] ?? '';
      _featured = data[FEATURED] ?? false;
      _itemsId = data[ITEMSID] ?? '';
      _userLikes = List<String>.from(data[USER_LIKES] ?? []);
      _description = data[DESCRIPTION] ?? '';
    } else {
      _id = 0;
      _name = '';
      _image = '';
      _price = 0;
      _oldprice = 0;
      _sname = '';
      _category = '';
      _featured = false;
      _itemsId = 0;
      _userLikes = [];
      _description = '';
    }
  }

  int _parseToInt(dynamic value) {
    if (value is int) {
      return value;
    } else if (value is String) {
      return int.tryParse(value) ?? 0;
    } else {
      return 0;
    }
  }

}