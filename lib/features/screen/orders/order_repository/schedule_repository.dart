import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/providers/firebase_provider.dart';
import '../../../../models/doctor_model.dart';

final ScheduleRepositoryProvider = Provider(
    (ref) => ScheduleRepository(firestore: ref.watch(fireStoreProvider)));

class ScheduleRepository {
  final FirebaseFirestore _firestore;

  ScheduleRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  CollectionReference get _schedule => _firestore.collection("schedule");

  addbooking({required DoctorModel drmodel}) {
    _schedule.add(drmodel.toMap()).then((value) {
      value.update(drmodel.copyWith(id: value.id).toMap());
    });
  }
}
