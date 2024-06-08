import 'package:cloud_firestore/cloud_firestore.dart';


class LookBook23Model {
  static const IMAGE = 'image';

  late String _image;

  // getters
   String get image => _image;

  LookBook23Model.fromsnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    _image = data[IMAGE] ?? '';
  }
}

