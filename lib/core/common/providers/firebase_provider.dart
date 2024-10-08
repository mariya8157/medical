import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical/models/medicine_model.dart';
import 'package:medical/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final fireStoreProvider = Provider((ref) => FirebaseFirestore.instance);
final firebaseAuthProvider = Provider((ref) => FirebaseAuth.instance);
final cartNotifier =
    StateNotifierProvider<CartNotifier, List<MedicineModel>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<MedicineModel>> {
  CartNotifier() : super([]);

  updateList(
    MedicineModel medicineModel,
  ) {
    state.add(medicineModel);
    print(state);
  }
}

// class MedDataProvider extends ChangeNotifier {
//   SharedPreferences? _prefs;
//   MedicineModel? _user;
//
//   Future<void> initializePrefs() async {
//     _prefs = await SharedPreferences.getInstance();
//     _loadMedFromPrefs();
//   }
//
//   MedicineModel? getMedicine() => _user;
//
//   void setMedicine(MedicineModel medicine) {
//     _user = medicine;
//     _saveMedicineToPrefs(medicine);
//     notifyListeners();
//   }
//
//   Future<void> _loadMedFromPrefs() async {
//     if (_prefs != null) {
//       final String? medicineJson = _prefs!.getString('medicineData');
//       if (medicineJson != null) {
//         _user = decodeMedicine(medicineJson);
//       }
//     }
//   }
//
//   Future<void> _saveMedicineToPrefs(MedicineModel medicine) async {
//     if (_prefs != null) {
//       await _prefs!.setString('medicineData', encodeMedicine(medicine));
//     }
//   }
//   String encodeMedicine(MedicineModel medicine) {
//     return jsonEncode(medicine.toJson());
//   }
//   MedicineModel? decodeMedicine(String medicineJson) {
//     return MedicineModel.fromJson(jsonDecode(medicineJson));
//   }
// }
