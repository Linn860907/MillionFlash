import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:millionflashapp/models/cart_item.dart';
import 'package:millionflashapp/models/order.dart';


class OrderServices{
  String collection = "orders";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createOrder({required String userId ,required String id,required String status ,required List<CartItemModel> cart,required int totalPrice}) {
   List<Map> convertedCart = [];
   List<String> itemsIds = [];

   for(CartItemModel cartitemModel in cart){
     convertedCart.add(cartitemModel.toMap());
     itemsIds.add(cartitemModel.itemsId.toString());
   }


    _firestore.collection(collection).doc(id).set({
      "userId": userId,
      "id": id,
      "itemsIds": itemsIds,
      "cart": convertedCart,
      "total": totalPrice,
      "createdAt": DateTime.now().millisecondsSinceEpoch,
      "status": status,
    });
  }

  Future<List<OrderModel>> getUserOrders({required String userId}) async =>
      _firestore
          .collection(collection)
          .where("userId", isEqualTo: userId)
          .get()
          .then((result) {
        List<OrderModel> orders = [];
        for (DocumentSnapshot order in result.docs) {
          orders.add(OrderModel.fromSnapshot(order));
        }
        return orders;
      });
}