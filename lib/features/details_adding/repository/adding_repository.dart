import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/firebaseProviders.dart';
import '../../../models/model1.dart';

final AddingRepositoryProvider= Provider((ref) => AddingRepository(firestore: ref.watch(fireStoreProvider)));

class AddingRepository{
  final FirebaseFirestore _firestore;
  AddingRepository({required FirebaseFirestore firestore}):_firestore=firestore;

  CollectionReference get _users => _firestore.collection("users");
  CollectionReference get _signup => _firestore.collection("signup");

  addingFunction ({required UsersModel usersModel}){
    _users.add(usersModel.toMap());
  }
  addingSignup ({required UsersModel usersModel}){
    _signup.add(usersModel.toMap());
  }
  }

