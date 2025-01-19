import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:event_planning_pojo/ui/model/user_model.dart';
import 'package:event_planning_pojo/ui/screens/home/home_screen.dart';
import 'package:event_planning_pojo/ui/widgets/alert_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(UserModel.collectionName)
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) {
            return UserModel.fromFirestore(snapshot.data()!);
          },
          toFirestore: (user, _) => user.toFirestore(),
        );
  }

  static Future<void> addUser(UserModel user) {
    var collection = getUserCollection().doc(user.id).set(user);
    return collection;
  }

  static Future<UserModel?> readUser(String id) async {
    DocumentSnapshot<UserModel> doc = await getUserCollection().doc(id).get();
    return doc.data();
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance
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
    } on FirebaseAuthException catch (e) {
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

      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      await Future.delayed(Duration(seconds: 1));
      Navigator.pushNamedAndRemoveUntil(
        context,
        HomeScreen.tag,
        (route) => false,
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
      DialogUtils.showLoding(context, "loading".tr());
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

      if (userCredential.user != null) {
        UserModel userModel = UserModel(
            email: userCredential.user!.email ?? "",
            name: userCredential.user!.displayName ?? "",
            image: userCredential.user!.photoURL ?? "",
            id: userCredential.user!.uid);
        AuthService.addUser(userModel);
        await Future.delayed(Duration(milliseconds: 1750), () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeScreen.tag,
            (route) => false,
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

  Future<UserCredential> signInWithFacebook(BuildContext context) async {
    // Trigger the sign-in flow
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      if (loginResult.status == LoginStatus.cancelled) {
        return Future.error("something_went_wrong");
      }
      DialogUtils.showLoding(context, "loading".tr());

      if (loginResult.status == LoginStatus.failed) {
        return Future.error("something_went_wrong");
      }

      UserCredential user = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);

      if (user.user != null) {
        UserModel userModel = UserModel(
            email: user.user?.email ?? "",
            name: user.user?.displayName ?? "",
            image: user.user?.photoURL ?? "",
            id: user.user?.uid);
        AuthService.addUser(userModel);
        await Future.delayed(Duration(milliseconds: 1750), () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeScreen.tag,
            (route) => false,
          );
        });
      }
      return user;
    } on FirebaseAuthException catch (e) {
      DialogUtils.hideLoding(context);

      snack("${"error".tr()} : $e", context);
      return Future.error(e);
    } catch (e) {
      DialogUtils.hideLoding(context);

      snack("something_went_wrong", context);
      return Future.error(e);
    }
  }

  Future<void> signOut(BuildContext context) async {
    GoogleSignIn googleSignOut = GoogleSignIn();
    googleSignOut.disconnect();
    await FirebaseAuth.instance.signOut();
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
///kG2xW1woXF70OMAJ2o+Nlt1e+q8=