// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning_pojo/ui/screens/auth/login_screen.dart';
import 'package:event_planning_pojo/ui/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

      await Future.delayed(Duration(seconds: 1));
      Navigator.pop(
        context,
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Account created successfully'),
            duration: Duration(seconds: 3),
          ),
        ),
      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(userCredential.user!.uid)
          .set({
        "name": name,
        "email": email,
      });
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';
      if (e.code == 'email-already-in-use') {
        errorMessage = ('Something Went Wrong Please try again.');
      } else if (e.code == 'invalid-email') {
        errorMessage = 'Something went wrong. Please try again.';
      } else if (e.code == 'network-request-failed') {
        errorMessage = 'Something went wrong. Please try again.';
      } else {
        errorMessage = 'Something went wrong. Please try again.';
      }
      snack(errorMessage, context);
    } catch (e) {
      print('Error : $e');
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
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
      String errorMessage = '';
      if (e.code == 'wrong-password') {
        errorMessage = 'Something went wrong. Please try again.';
      } else if (e.code == 'user-not-found') {
        errorMessage = 'Something went wrong. Please try again.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'Something went wrong. Please try again.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'Something went wrong. Please try again.';
      } else if (e.code == 'network-request-failed') {
        errorMessage = 'Something went wrong. Please try again.';
      } else {
        errorMessage = 'Something went wrong. Please try again.';
      }
      snack(errorMessage, context);
    } catch (e) {
      print('Error : $e');
    }
  }

  Future signInWithGoogle(BuildContext context) async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return; // The user canceled the sign-in
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
     UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCredential.user;
      
      if (user != null) {
        String name = user.displayName ?? '';
        String email = user.email ?? '';
        Navigator.pushNamedAndRemoveUntil(
          context,
          HomeScreen.tag,
          (route) => false,
           arguments: {
            'name': name,
            'email': email,
            'initialTabIndex': 0, // Home tab index
          },
        );
        print("Name: $name, Email: $email");
      }

      // await Future.delayed(Duration(seconds: 1));
      
    } on FirebaseAuthException catch (e) {
      snack("${e.message}", context);
    } catch (e) {
      print('Error : $e');
      snack("Something went wrong. Please try again.", context);
    }
  }

  Future<void> signOut(BuildContext context) async {
    GoogleSignIn googleSignOut = GoogleSignIn();
    googleSignOut.disconnect();
    await FirebaseAuth.instance.signOut();
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushNamedAndRemoveUntil(
      context,
      LoginScreen.tag,
      (route) => false,
    );
  }

  void snack(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
