import 'package:cloud_firestore/cloud_firestore.dart';


class LookBook22Model {
  static const IMAGE = 'image';

  late String _image;

  // getters
   String get image => _image;

  LookBook22Model.fromsnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    _image = data[IMAGE] ?? '';
  }

}

