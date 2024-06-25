import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/doctormodel.dart';
import '../repository/doctor_repository.dart';

final DoctorControllerProvider = Provider((ref) => DoctorController(doctorRepository: ref.watch(DoctorRepositoryProvider)));
final StreamDocProvider = StreamProvider((ref) => ref.watch(DoctorControllerProvider).StreamDoctorData());

class DoctorController{
  final DoctorRepository _doctorRepository;
  DoctorController({required DoctorRepository doctorRepository}): _doctorRepository= doctorRepository;

  addDoctorData(DoctorModel docData){
    _doctorRepository.add(docData);
  }
  Stream StreamDoctorData(){
    return _doctorRepository.streamDoc();
  }
  deleteData(DoctorModel docDelete){
    _doctorRepository.deleteDoc(docDelete);
  }
  updateData(DoctorModel docUpdate){
    _doctorRepository.UpdateDoc(docUpdate);
  }



}