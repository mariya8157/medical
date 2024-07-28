import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical/models/hospital_model.dart';

import '../providers/firebase_provider.dart';

final HsptlRepositoryProvider = Provider((ref) => HsptlRepository(firestore: ref.watch(fireStoreProvider)));

class HsptlRepository {
  final FirebaseFirestore _firestore;

  HsptlRepository({required FirebaseFirestore firestore})
      :_firestore=firestore;

  CollectionReference get _hsptl => _firestore.collection("hsptl");

  add(HsptlModel hsptlData) {
    _hsptl.add(hsptlData.toMap()).then((value) {
      value.update(hsptlData.copyWith(id: value.id).toMap());
    },);
  }

  deleteHsptl(HsptlModel hsptlDelete) {
    _hsptl.doc(hsptlDelete.id).delete();
  }

  streamHsptl() {
    return _hsptl.snapshots().map((event) =>
        event.docs.map((e) =>
            HsptlModel.fromMap(e.data() as Map<String, dynamic>)).toList());
  }

  UpdateHsptl(HsptlModel hsptledit) {
    print(_hsptl.doc(hsptledit.id));
    _hsptl.doc(hsptledit.id).update(hsptledit.toMap()).then((value) {},);
  }

}
