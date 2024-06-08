import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart'; 
import '../helpers/user.dart'; 
import '../models/user.dart'; 

enum Status{Uninitialized, Unauthenticated, Authenticating, Authenticated}

class UserProvider with ChangeNotifier{
  late FirebaseAuth _auth;
  User? _user;
  Status _status = Status.Uninitialized;
  UserServices _userServices = UserServices();
  UserModel? _userModel;

  // getters

  Status get status => _status;
  UserModel get userModel => _userModel!;
  User? get user => _user;

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
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _auth.signInWithCredential(credential);
      _userServices.createUser({
        "name": googleUser.displayName ?? '',
        "email": googleUser.email,
        "id": _auth.currentUser!.uid,
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

Future<void> _onStateChanged(User? firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      _userModel = await _userServices.getUserById(firebaseUser.uid);
      _status = Status.Authenticated;
    }
    notifyListeners();
  }

  void cleanControllers() {
    email.text = "";
    password.text = "";
    name.text = "";
  }

}

