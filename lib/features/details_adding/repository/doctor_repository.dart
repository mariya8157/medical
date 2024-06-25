import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/doctormodel.dart';
import '../providers/firebaseprovider1.dart';

///doctor
final DoctorRepositoryProvider = Provider((ref) => DoctorRepository(firestore: ref.watch(fireStoreProvider)));

class DoctorRepository{
  final FirebaseFirestore _firestore;
  DoctorRepository({required FirebaseFirestore firestore}):_firestore=firestore;

  CollectionReference get _doctors => _firestore.collection("doctors");
  CollectionReference get _schedule => _firestore.collection("schedule");

  add(DoctorModel docData){
    _doctors.add(docData.toMap()).then((value) {
      value.update(docData.copyWith(id: value.id).toMap());
    },);
  }

  deleteDoc(DoctorModel docDelete){
    _doctors.doc(docDelete.id).delete();
  }
  streamDoc(){
    return _doctors.snapshots().map((event) => event.docs.map((e) => DoctorModel.fromMap(e.data() as Map<String, dynamic>)).toList());
  }

  UpdateDoc(DoctorModel docedit){
    print(_doctors.doc(docedit.id));
    _doctors.doc(docedit.id).update(docedit.toMap()).then((value) {
    },);
  }

  addbooking(List a){
    _schedule.add({
      "booking": a
    }).then((value) {
      value.update({
        "id": value.id
      });
    });
  }

}