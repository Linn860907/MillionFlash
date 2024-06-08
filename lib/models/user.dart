import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const NAME = 'name';
  static const EMAIL = 'email';
  static const ID = 'id';
  static const STRIPE_ID = 'stripe_id';


  late String _name;
  late String _email;
  late String _id;
  late String _stripeId;


  // getters

  String get name => _name;
  String get email => _email;
  String get id => _id;
  String get stripeId => _stripeId;

  UserModel.fromsnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    if (data != null) {
      _name = data[NAME] ?? '';
      _email = data[EMAIL] ?? '';
      _id = data[ID] ?? '';
      _stripeId = data[STRIPE_ID] ?? '';
    } else {
      _name = '';
      _email = '';
      _id = '';
      _stripeId = '';
    }
  }
}
