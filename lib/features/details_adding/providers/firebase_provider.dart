import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical/models/medicine_model.dart';

final fireStoreProvider = Provider((ref) => FirebaseFirestore.instance);
final firebaseAuthProvider = Provider((ref) => FirebaseAuth.instance);
final cartNotifier = StateNotifierProvider<CartNotifier,List<MedicineModel>>((ref) {
return CartNotifier(

);
});
class CartNotifier extends StateNotifier<List<MedicineModel>> {
  CartNotifier():super([]);
  updateList(MedicineModel medicineModel){
   state.add(medicineModel);
   print(state);
  }

}





