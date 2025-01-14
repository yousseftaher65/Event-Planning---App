import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:event_planning_pojo/ui/screens/auth/login_screen.dart';
import 'package:event_planning_pojo/ui/screens/home/home_screen.dart';
import 'package:event_planning_pojo/ui/widgets/alert_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:flutter/material.dart';

class AuthService {
  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await Future.delayed(Duration(seconds: 1), () {
        Navigator.pop(
          context,
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Account created successfully'),
              duration: Duration(seconds: 3),
            ),
          ),
        );
      });

      await FirebaseFirestore.instance
          .collection("users")
          .doc(userCredential.user!.uid)
          .set({
        "name": name,
        "email": email,
      });

      // DialogUtils.hideLoding(context);
    } on FirebaseAuthException catch (e) {
      // DialogUtils.hideLoding(context);
      String errorMessage = '';
      if (e.code == 'email-already-in-use') {
        errorMessage = ("something_went_wrong");
      } else if (e.code == 'invalid-email') {
        errorMessage = "something_went_wrong";
      } else if (e.code == 'network-request-failed') {
        errorMessage = "something_went_wrong";
      } else {
        errorMessage = "something_went_wrong";
      }
      snack(errorMessage, context);
    } catch (e) {
      DialogUtils.hideLoding(context);

      snack("${"error".tr()} : $e", context);
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      DialogUtils.showLoding(context, "loading".tr());

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(userCredential.user!.uid)
          .get();

      final String userName = documentSnapshot.get('name');
      final String userEmail = documentSnapshot.get('email');

      await Future.delayed(Duration(seconds: 1));
      Navigator.pushNamedAndRemoveUntil(
        context,
        HomeScreen.tag,
        (route) => false,
        arguments: {'name': userName, 'email': userEmail},
      );
    } on FirebaseAuthException catch (e) {
      DialogUtils.hideLoding(context);

      String errorMessage = '';
      if (e.code == 'wrong-password') {
        errorMessage = "something_went_wrong";
      } else if (e.code == 'user-not-found') {
        errorMessage = "something_went_wrong";
      } else if (e.code == 'email-already-in-use') {
        errorMessage = "something_went_wrong";
      } else if (e.code == 'invalid-email') {
        errorMessage = "something_went_wrong";
      } else if (e.code == 'network-request-failed') {
        errorMessage = "something_went_wrong";
      } else {
        errorMessage = "something_went_wrong";
      }
      snack(errorMessage, context);
    } catch (e) {
      DialogUtils.hideLoding(context);

      snack("${"error".tr()} : $e", context);
    }
  }

  Future signInWithGoogle(BuildContext context) async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return; // The user canceled the sign-in
      }
      DialogUtils.showLoding(context,  "loading".tr());
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        String name = user.displayName ?? '';
        String email = user.email ?? '';
        await Future.delayed(Duration(milliseconds: 1750), () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeScreen.tag,
            (route) => false,
            arguments: {
              'name': name,
              'email': email,
            },
          );
        });
      }
    } on FirebaseAuthException catch (e) {
      DialogUtils.hideLoding(context);

      snack("${"error".tr()} : $e", context);
    } catch (e) {
      DialogUtils.hideLoding(context);

      snack("something_went_wrong", context);
    }
  }

  Future<void> signOut(BuildContext context) async {
    GoogleSignIn googleSignOut = GoogleSignIn();
    googleSignOut.disconnect();
    await FirebaseAuth.instance.signOut();
    await Future.delayed(Duration(seconds: 1), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        LoginScreen.tag,
        (route) => false,
      );
    });
  }

  void snack(String message, BuildContext context) {
    Fluttertoast.showToast(
        msg: message.tr(),
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
