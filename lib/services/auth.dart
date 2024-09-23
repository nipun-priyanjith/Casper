import 'dart:async';

import 'package:casper/models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  //firebase instant
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create a user from ifrebase with uid
  UserModel? _userwithFirebaseUserUid(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  //create the steam for checking the auth changes in the user
  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userwithFirebaseUserUid);
  }

  //register using email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userwithFirebaseUserUid(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  //sign in using email and pw
  Future signInUsingEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userwithFirebaseUserUid(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }
  //sign in using gmail

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (err) {
      print(err.toString());
      return null;
    }
  }
}
