import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/ambulanceModel.dart';
import '../../../models/doctormodel.dart';
import '../../../models/model1.dart';
import '../../../models/model2.dart';
import '../providers/firebaseprovider1.dart';
import '../screen/home/homepage.dart';

final AddingRepositoryProvider= Provider((ref) => AddingRepository(firestore: ref.watch(fireStoreProvider), firebaseAuth: ref.watch(firebaseAuthProvider)));

class AddingRepository{
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;
  AddingRepository({required FirebaseAuth firebaseAuth,required FirebaseFirestore firestore}):_firebaseAuth=firebaseAuth,_firestore=firestore;

  CollectionReference get _users => _firestore.collection("users");

  add(name, email, password, id){
    UsersModel userData = UsersModel(
        name: name,
        email: email,
        password: password,
        id: ''
    );

    _users.add(userData.toMap()).then((value) {
      value.update(userData.copyWith(id: value.id).toMap());
      _users.doc(userData.email.trim()).set(userData.toMap());
    },);
  }

  addingUser(name, email, password){
    _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  }





