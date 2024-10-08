import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical/models/medicine_model.dart';
import '../../../../../models/user_model.dart';
import '../../../../core/common/providers/firebase_provider.dart';

final AddingRepositoryProvider = Provider((ref) => AddingRepository(
    firestore: ref.watch(fireStoreProvider),
    firebaseAuth: ref.watch(firebaseAuthProvider)));

class AddingRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  AddingRepository(
      {required FirebaseAuth firebaseAuth,
      required FirebaseFirestore firestore})
      : _firebaseAuth = firebaseAuth,
        _firestore = firestore;

  CollectionReference get _users => _firestore.collection("users");

  add(name, email, password, id, cart, wish) {
    UsersModel userData = UsersModel(
      name: name,
      email: email,
      password: password,
      id: email,
      cart: [],
      wish: [],
    );

    // _users.add(userData.toMap()).then((value) {
    //   value.update(userData.copyWith(id: value.id).toMap());
    // },
    _users.doc(userData.email.trim()).set(userData.toMap());
  }

  addingUser(name, email, password, id, cart, wish) {
    _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  updateCart(UsersModel usersModel, MedicineModel medicineModel) {
    usersModel.cart.add(medicineModel.toMap());
    _users
        .doc(usersModel.id)
        .update(usersModel.copyWith(cart: usersModel.cart).toMap());
  }

  updateWish(UsersModel usersModel, MedicineModel medicineModel) {
    usersModel.wish.add(medicineModel.toMap());
    _users
        .doc(usersModel.id)
        .update(usersModel.copyWith(wish: usersModel.wish).toMap());
  }
}
