import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../models/medicine_model.dart';
import '../../../../core/common/providers/firebase_provider.dart';

final MedicineRepositoryProvider = Provider(
    (ref) => MedicineRepository(firestore: ref.watch(fireStoreProvider)));

class MedicineRepository {
  final FirebaseFirestore _firestore;

  MedicineRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  CollectionReference get _medicine => _firestore.collection("medicine");

  add(MedicineModel medData) {
    _medicine.add(medData.toMap()).then(
      (value) {
        value.update(medData.copyWith(id: value.id).toMap());
      },
    );
  }

  deleteMed(String id) {
    _medicine.doc(id).delete();
  }

  streamMed() {
    return _medicine.snapshots().map((event) => event.docs
        .map((e) => MedicineModel.fromMap(e.data() as Map<String, dynamic>))
        .toList());
  }

  UpdateMed(MedicineModel mededit) {
    _medicine.doc(mededit.id).update(mededit.toMap());
  }
}
