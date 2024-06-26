import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:millionflashapp/models/cart_item.dart';
import 'package:millionflashapp/models/user.dart';

class UserServices{
  String collection = 'users';
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createUser(Map<String, dynamic> values) {
    String id = values["id"];
    _firestore.collection(collection).doc(id).set(values);
  }

  void updateUserData (Map<String, dynamic> values) {
    _firestore.collection(collection).doc(values['id']).update(values);}


  void addToCart({required String userId, required CartItemModel cartItem}){
    print("THE USER ID IS: $userId");
    print("cart items are: ${cartItem.toString()}");
    _firestore.collection(collection).doc(userId).update({
      "cart": FieldValue.arrayUnion([cartItem.toMap()])
    });
  }

  void removeFromCart({required String userId, required CartItemModel cartItem}){
    print("THE USER ID IS: $userId");
    print("cart items are: ${cartItem.toString()}");
    _firestore.collection(collection).doc(userId).update({
      "cart": FieldValue.arrayRemove([cartItem.toMap()])
    });
  }
  
  Future<UserModel> getUserById (String id) => _firestore.collection(collection).doc(id).get().then((doc){
    return UserModel.fromsnapshot(doc);
  });
  

  
}
