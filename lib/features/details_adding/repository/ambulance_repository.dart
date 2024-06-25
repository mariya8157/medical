import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/ambulanceModel.dart';
import '../providers/firebaseprovider1.dart';

///ambulance

final AmbulanceRepositoryProvider = Provider((ref) => AmbulanceRepository(firestore: ref.watch(fireStoreProvider)));

class AmbulanceRepository {
  final FirebaseFirestore _firestore;

  AmbulanceRepository({required FirebaseFirestore firestore})
      :_firestore=firestore;

  CollectionReference get ambulance => _firestore.collection("ambulance");

  add(AmbulanceModel ambulanceData) {
    ambulance.add(ambulanceData.toMap()).then((value) {
      value.update(ambulanceData.copyWith(id: value.id).toMap());
    },);
  }

  deleteAmbulance(AmbulanceModel ambulanceDelete) {
    ambulance.doc(ambulanceDelete.id).delete();
  }

  streamAmbulance() {
    return ambulance.snapshots().map((event) =>
        event.docs.map((e) =>
            AmbulanceModel.fromMap(e.data() as Map<String, dynamic>)).toList());
  }

  UpdateAmbulance(AmbulanceModel ambulanceedit) {
    print(ambulance.doc(ambulanceedit.id));
    ambulance.doc(ambulanceedit.id).update(ambulanceedit.toMap()).then((
        value) {},);
  }

}