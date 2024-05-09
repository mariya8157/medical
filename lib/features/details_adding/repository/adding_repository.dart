import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/firebaseProviders.dart';
import '../../../models/model1.dart';
import '../screen/home/homepage.dart';

final AddingRepositoryProvider= Provider((ref) => AddingRepository(firestore: ref.watch(fireStoreProvider), firebaseAuth: ref.watch(firebaseAuthProvider)));

class AddingRepository{
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;
  AddingRepository({required FirebaseAuth firebaseAuth,required FirebaseFirestore firestore}):_firebaseAuth=firebaseAuth,_firestore=firestore;

  CollectionReference get _users => _firestore.collection("users");

  addingFunction ({required UsersModel usersModel}){
    _users.add(usersModel.toMap());
  }

  addingUser(name, email, password){
    _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }
  gettingUser(name,email,password){
    _firebaseAuth.signInWithEmailAndPassword(email: email, password: password).then((value) async {
      var data = await _users.where('email',isEqualTo: email).get();

      if (data.docs.isNotEmpty) {


          if (data.docs[0]['password'] == password.text) {
            addingFunction(usersModel: UsersModel(name: name, email: email, password: password));
          }
          else {
            showUploadMessage(BuildContext context, String message){
              return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong Password"),));
            } }
        }
          else{
        showUploadMessage(BuildContext context, String message){
          return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Register"),));
        } }
    },);
  }

  }
