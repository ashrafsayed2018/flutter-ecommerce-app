import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../services/firestore_user.dart';

class AuthController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? name, email, password;
  final Rxn<User> _user = Rxn<User>();
  String? get user => _user.value?.email;
  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // facebook auth  method
  void facebookSigninMethod() async {}

  void googleSignMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    // get the google signin account
    GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    // get the credentials to (access / id token)
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: (googleAuth.accessToken)!,
      idToken: (googleAuth.idToken)!,
    );
    // authenticate with firebase
    await _auth.signInWithCredential(credential).then(
      (userData) async {
        //  create new user model

        saveUser(userData);
      },
    );
  }

// logout from firebase with google accouunt and getx
  void googleSignOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  //  signin to firebase with email and password
  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email!, password: password!);

      Get.offAll(() => HomeView());
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        "خطأ في تسجيل الدخول ",
        "حاول مرة اخرى",
        colorText: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  //  create new account to firebase with email and password
  void createAccountWithEmailAndPassword() async {
    try {
      //  create new account with email and password
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then(
        (userData) async {
          //  create new user model
          saveUser(userData);
        },
      );
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        "خطأ في تسجيل الدخول ",
        "حاول مرة اخرى",
        colorText: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential userData) async {
    await FirestoreUser().createUser(UserModel(
      userId: userData.user!.uid,
      name: name ?? userData.user!.displayName,
      email: userData.user!.email,
      picureUrl: "",
    ));

    Get.offAll(() => HomeView());
  }
}
