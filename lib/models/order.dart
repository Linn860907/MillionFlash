import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  static const ID = "id";
  static const CART = "cart";
  static const USER_ID = "userId";
  static const TOTAL = "total";
  static const STATUS = "status";
  static const CREATED_AT = "createdAt";
  static const ITEMSID = "itemsId";
  static const NAME = 'name';

  late String _id;
  late String _itemsId;
  late String _userId;
  late String _status;
  late int _createdAt;
  late int _total;
  late String _name;

  // getters
  String get id => _id;
  String get itemsId => _itemsId;
  String get userId => _userId;
  String get status => _status;
  int get total => _total;
  int get createdAt => _createdAt;
  String get name => _name;

  // public variable
  late List<dynamic> cart;

  OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>?;

    if (data != null) {
      _id = data[ID] ?? '';
      _total = data[TOTAL] ?? 0;
      _status = data[STATUS] ?? '';
      _userId = data[USER_ID] ?? '';
      _createdAt = data[CREATED_AT] ?? 0;
      _itemsId = data[ITEMSID] ?? '';
      cart = data[CART] ?? [];
      _name = data[NAME] ?? '';
    } else {
      _id = '';
      _total = 0;
      _status = '';
      _userId = '';
      _createdAt = 0;
      _itemsId = '';
      _name = '';
      cart = [];
    }
  }
}
