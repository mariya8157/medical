import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/doctor_model.dart';
import '../repository/doctor_repository.dart';

final DoctorControllerProvider = Provider((ref) =>
    DoctorController(doctorRepository: ref.watch(DoctorRepositoryProvider)));
final StreamDocProvider = StreamProvider.family((ref, String search) =>
    ref.watch(DoctorControllerProvider).StreamDoctorData(search));

class DoctorController {
  final DoctorRepository _doctorRepository;

  DoctorController({required DoctorRepository doctorRepository})
      : _doctorRepository = doctorRepository;

  addDoctorData(DoctorModel docData) {
    _doctorRepository.add(docData);
  }

  Stream StreamDoctorData(String search) {
    return _doctorRepository.streamDoc(search);
  }

  deleteData(DoctorModel docDelete) {
    _doctorRepository.deleteDoc(docDelete);
  }

  updateData(DoctorModel docUpdate) {
    _doctorRepository.UpdateDoc(docUpdate);
  }
}
