import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/medicine_model.dart';
import '../repository/medicine_repository.dart';

final MedicineControllerProvider = Provider((ref) => MedicineController(
    medicineRepository: ref.watch(MedicineRepositoryProvider)));
final StreamMedProvider = StreamProvider(
    (ref) => ref.watch(MedicineControllerProvider).StreamMedicineData());

class MedicineController {
  final MedicineRepository _medicineRepository;

  MedicineController({required MedicineRepository medicineRepository})
      : _medicineRepository = medicineRepository;

  addMedicineData(MedicineModel medAdd) {
    _medicineRepository.add(medAdd);
  }

  Stream StreamMedicineData() {
    return _medicineRepository.streamMed();
  }

  delete(String id) {
    _medicineRepository.deleteMed(id);
  }

  updateData(MedicineModel medUpdate) {
    _medicineRepository.UpdateMed(medUpdate);
  }
}
