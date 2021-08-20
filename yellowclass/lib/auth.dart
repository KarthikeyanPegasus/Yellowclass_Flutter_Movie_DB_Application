import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yellowclass/Screens/Dashboard/Dashboard.dart';
import 'package:yellowclass/Screens/EditHome/EditHome.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

//Sign in function
Future<User> signinwithGoogle(BuildContext context) async {
  //Signing in with google
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  //Creating credential for firebase
  final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken);

  //Signing in with credential, making a user in firebase and getting user class
  final userCredential = await _auth.signInWithCredential(credential);
  final User user = userCredential.user;

  //Checking
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final User currentUser = await _auth.currentUser;
  assert(currentUser.uid == user.uid);
  print(user);
  if (user.emailVerified) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Edithome()));
  }
  return user;
}
