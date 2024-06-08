import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/products.dart';

class ProductServices {
  String collection = 'products';
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ProductModel>> getProduts() async {
    try {
      QuerySnapshot result = await _firestore.collection(collection).get();
      List<ProductModel> products = result.docs.map((doc) => ProductModel.fromsnapshot(doc)).toList();
      return products;
    } catch (e) {
      print(e);
      return [];
    }
  }

  // Future<List<ProductModel>> getProdutsByItems({required int id, required int itemsId}) async {
  //   try {
  //     QuerySnapshot result = await _firestore.collection(collection).where("itemsId", isEqualTo: id).get();
  //     List<ProductModel> products = result.docs.map((doc) => ProductModel.fromsnapshot(doc)).toList();
  //     return products;
  //   } catch (e) {
  //     print(e);
  //     return [];
  //   }
  // }

  // Future<List<ProductModel>> getProductsOfCategory({required String category}) async {
  //   try {
  //     QuerySnapshot result = await _firestore.collection(collection).where('category', isEqualTo: category).get();
  //     List<ProductModel> products = result.docs.map((doc) => ProductModel.fromsnapshot(doc)).toList();
  //     return products;
  //   } catch (e) {
  //     print(e);
  //     return [];
  //   }
  // }
}
