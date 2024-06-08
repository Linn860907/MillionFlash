import 'package:cloud_firestore/cloud_firestore.dart';


class LookBook21Model {
  static const IMAGE = 'image';

  late String _image;

  // getters
   String get image => _image;

  LookBook21Model.fromsnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    _image = data[IMAGE] ?? '';
  }

}

