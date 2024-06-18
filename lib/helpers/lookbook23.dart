import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/lookbook23.dart';

class LookBook23Services {
  String collection = 'lookbook23';
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<LookBook23Model>> getLookbook23() async {
    try {
      QuerySnapshot result = await _firestore.collection(collection).get();
      List<LookBook23Model> lookbook23 = result.docs.map((doc) => LookBook23Model.fromsnapshot(doc)).toList();
      return lookbook23;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
