import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/ambulance_model.dart';
import '../../../models/doctor_model.dart';
import '../../../models/user_model.dart';
import '../../../models/address_model.dart';
import '../providers/firebase_provider.dart';
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
        id: email
    );

    // _users.add(userData.toMap()).then((value) {
    //   value.update(userData.copyWith(id: value.id).toMap());
    // },
        _users.doc(userData.email.trim()).set(userData.toMap());
  }

  addingUser(name, email, password, id){
    _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }
  }



