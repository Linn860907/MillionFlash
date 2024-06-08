import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/items.dart';

class ItemServices {
  String collection = 'items';
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ItemModel>> getItems() async {
    try {
      QuerySnapshot result = await _firestore.collection(collection).get();
      List<ItemModel> items = result.docs.map((doc) => ItemModel.fromsnapshot(doc)).toList();
      return items;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<ItemModel>> getItemsByItemsId({required int id, required int itemsId}) async {
    try {
      QuerySnapshot result = await _firestore.collection(collection).where("itemsId", isEqualTo: id).get();
      List<ItemModel> items = result.docs.map((doc) => ItemModel.fromsnapshot(doc)).toList();
      return items;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<ItemModel>> getItemsOfCategory({required String category}) async {
    try {
      QuerySnapshot result = await _firestore.collection(collection).where('category', isEqualTo: category).get();
      List<ItemModel> items = result.docs.map((doc) => ItemModel.fromsnapshot(doc)).toList();
      return items;
    } catch (e) {
      print(e);
      return [];
    }
}

  Future<List<ItemModel>> searchItems({required String itemsName}) async {
    String searchKey = itemsName[0].toUpperCase() + itemsName.substring(1);
    try {
      QuerySnapshot result = await _firestore.collection(collection).orderBy('name').startAt([searchKey]).endAt([searchKey + '\uf8ff']).get();
      List<ItemModel> items = result.docs.map((doc) => ItemModel.fromsnapshot(doc)).toList();
      return items;
    } catch (e) {
      print(e);
      return [];
    }
  }
  
}