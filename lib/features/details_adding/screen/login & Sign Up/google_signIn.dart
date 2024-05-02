



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medical/features/details_adding/screen/login%20&%20Sign%20Up/signup.dart';

import '../home/bottomnavigation.dart';
import '../home/homepage.dart';
import 'login.dart';

signInWithGoogle(BuildContext context) async {




  final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication? googleSignInAuthentication = await googleSignInAccount?.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication?.idToken,
      accessToken: googleSignInAuthentication?.accessToken);

  UserCredential result = await FirebaseAuth.instance.signInWithCredential(credential);



  User? userDetails = result.user;

  userName=userDetails!.displayName;
  userEmail=userDetails!.email;
  userImage=userDetails!.photoURL;

  //==========================================

  var userlist= await FirebaseFirestore.instance.collection("users").where("email",isEqualTo:userEmail).get();

  if(userlist.docs.isEmpty){
    Navigator.push(context, CupertinoPageRoute(builder: (context) => BottomNavigationPage(email: '', password: '',),));
  }else {
    userId = userlist.docs[0].id;

    // Navigator.push(context, CupertinoPageRoute(builder: (context) => HomePage(),));

  }
}