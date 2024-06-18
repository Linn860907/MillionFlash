import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/lookbook21.dart';

class LookBook21Services {
  String collection = 'lookbook21';
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<LookBook21Model>> getLookbook21() async {
    try {
      QuerySnapshot result = await _firestore.collection(collection).get();
      List<LookBook21Model> lookbook21 = result.docs.map((doc) => LookBook21Model.fromsnapshot(doc)).toList();
      return lookbook21;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
