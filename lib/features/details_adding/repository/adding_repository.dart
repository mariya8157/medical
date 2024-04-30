import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/firebaseProviders.dart';
import '../../../models/model1.dart';

final AddingRepositoryProvider= Provider((ref) => AddingRepository(firestore: ref.watch(fireStoreProvider)));

class AddingRepository{
  final FirebaseFirestore _firestore;
  AddingRepository({required FirebaseFirestore firestore}):_firestore=firestore;

  CollectionReference get _users => _firestore.collection("users");

  add(name, email, password) {
    UsersModel userData = UsersModel(
        name: name,
        email: email,
        password: password
    );

    _users.add(userData.toMap());
    _users.doc().update(userData.toMap());
  }

}