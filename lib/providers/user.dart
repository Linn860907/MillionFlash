import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:millionflashapp/helpers/order.dart';
import 'package:millionflashapp/models/cart_item.dart';
import 'package:millionflashapp/models/items.dart';
import 'package:millionflashapp/models/order.dart';
import 'package:uuid/uuid.dart';
import '../helpers/user.dart';
import '../models/user.dart';

enum Status { Uninitialized, Unauthenticated, Authenticating, Authenticated }

class UserProvider with ChangeNotifier {
  late FirebaseAuth _auth;
  User? _user;
  Status _status = Status.Uninitialized;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserServices _userServices = UserServices();
  OrderServices _orderServices = OrderServices();
  UserModel? _userModel;

  // getters

  Status get status => _status;
  UserModel get userModel => _userModel!;
  User? get user => _user;

  // public variables
  List<OrderModel> orders = [];

  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();

  UserProvider.initialize() {
    _auth = FirebaseAuth.instance;
    _auth.authStateChanges().listen(_onAuthStateChanged);
  }

  Future<bool> signIn() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future<bool> signUp() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      _userServices.createUser({
        "name": name.text.trim(),
        "email": email.text.trim(),
        "id": _auth.currentUser!.uid,
        "likeItems": []
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future signOut() async {
    await _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  void cleanControllers() {
    email.text = "";
    password.text = "";
    name.text = "";
  }

  Future<void> reloadUserModel() async {
    _userModel = await _userServices.getUserById(user!.uid);
    notifyListeners();
  }

  Future<void> _onAuthStateChanged(User? firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
      _userModel = await _userServices.getUserById(firebaseUser.uid);
    }
    notifyListeners();
  }

  Future<bool> signInWithGoogle() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _auth.signInWithCredential(credential);
      _userServices.createUser({
        "name": googleUser.displayName ?? '',
        "email": googleUser.email,
        "id": _auth.currentUser!.uid,
        "likeItems": []
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  //general methods

//   bool _onError(String error) {
//   _status = Status.Unauthenticated;
//   notifyListeners();
//   print("we got an error: $error");
//   return false;
// }

  Future<bool> addToCart(
      { required int quantity, required ItemModel item}) async {
    print("THE ITEM IS: ${item.toString()}");
    print("THE qty IS: ${quantity.toString()}");

    try { 
      var uuid = Uuid();
      String cartItemId = uuid.v4();
      List cart = _userModel?.cart ?? [];
      // int totalItemsSale = int.parse(item.price.replaceAll(',', '')) * quantity;
      // int price = int.parse(item.price.replaceAll(',', ''));
      // double totalItemsSale = item.price * quantity.toDouble(); 

      Map cartItem = {
        "id": cartItemId,
        "name": item.name,
        "image": item.image,
        "itemsId": item.itemsId,
        "totalItemsSale": item.price * quantity,
        "price": item.price,
        "quantity": quantity
      };

      CartItemModel cartitemModel = CartItemModel.fromMap(cartItem);
      cart.add(cartitemModel.toMap());
      print("CART ITEMS ARE: ${cart.toString()}");
      _userServices.addToCart(userId: _user!.uid, cartItem: cartitemModel);
      // await reloadUserModel();
      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  getOrders() async {
    orders = await _orderServices.getUserOrders(userId: _user!.uid);
    notifyListeners();
  }

  Future<bool> removeFromCart({required CartItemModel cartItem}) async {
    print("THE PRODUCT IS: ${cartItem.toString()}");

    try {
      _userServices.removeFromCart(userId: _user!.uid, cartItem: cartItem);
      await reloadUserModel();
      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }
}
