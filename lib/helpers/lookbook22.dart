import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/lookbook22.dart';

class LookBook22Services {
  String collection = 'lookbook22';
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<LookBook22Model>> getLookbook22() async {
    try {
      QuerySnapshot result = await _firestore.collection(collection).get();
      List<LookBook22Model> lookbook22 = result.docs.map((doc) => LookBook22Model.fromsnapshot(doc)).toList();
      return lookbook22;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
