import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/category.dart';

class CategoryServices {
  String collection = 'categories';
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getCategories() async {
    try {
      QuerySnapshot result = await _firestore.collection(collection).get();
      List<CategoryModel> categories = result.docs.map((doc) => CategoryModel.fromsnapshot(doc)).toList();
      return categories;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
