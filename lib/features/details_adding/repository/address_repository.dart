import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/model2.dart';
import '../providers/firebase_provider.dart';

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
