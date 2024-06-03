import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical/models/model2.dart';
import '../../../models/model1.dart';
import '../providers/firebaseProviders.dart';
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
    },);
  }

  addingUser(name, email, password){
    _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  }

  ///address

final AddressRepositoryProvider = Provider((ref) => AddressRepository(firestore: ref.watch(fireStoreProvider)));

class AddressRepository{
  final FirebaseFirestore _firestore;
  AddressRepository({required FirebaseFirestore firestore}):_firestore=firestore;

  CollectionReference get _address => _firestore.collection("address");

  add(AddressModel addressData){
    _address.add(addressData.toMap()).then((value) {
      value.update(addressData.copyWith(id: value.id).toMap());
    },);
  }

  deleteAddress(AddressModel addressDelete){
    _address.doc(addressDelete.id).delete();
  }
  streamAddress(){
    return _address.snapshots().map((event) => event.docs.map((e) => AddressModel.fromMap(e.data() as Map<String, dynamic>)).toList());
  }
  UpdateAddress(AddressModel addressedit){
    print(_address.doc(addressedit.id));
    _address.doc(addressedit.id).update(addressedit.toMap()).then((value) {
    },);
  }

}