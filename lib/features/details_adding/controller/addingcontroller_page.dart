import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical/models/model1.dart';

import '../../../models/ambulanceModel.dart';
import '../../../models/doctormodel.dart';
import '../../../models/model2.dart';
import '../repository/adding_repository.dart';

final AddingControllerProvider = Provider((ref) => AddingController(addingRepository: ref.watch(AddingRepositoryProvider)));

class AddingController{
  final AddingRepository _addingRepository;
  AddingController({required AddingRepository addingRepository}): _addingRepository= addingRepository;

  addUserData(name, email, password, id){
    _addingRepository.add(name, email, password, id);
  }
  addUser(name, email, password){
    _addingRepository.addingUser(name, email, password);
  }

}

///address

final AddressControllerProvider = Provider((ref) => AddressController(addressRepository: ref.watch(AddressRepositoryProvider)));
final StreamAddressProvider = StreamProvider((ref) => ref.watch(AddressControllerProvider).StreamAddressData());

class AddressController{
  final AddressRepository _addressRepository;
  AddressController({required AddressRepository addressRepository}): _addressRepository= addressRepository;

  addAddressData(AddressModel addressAdd){
    _addressRepository.add(addressAdd);
  }
  Stream StreamAddressData(){
    return _addressRepository.streamAddress();
  }
  deleteData(AddressModel AddressDelete){
    _addressRepository.deleteAddress(AddressDelete);
  }
  updateData(AddressModel addressUpdate){
    _addressRepository.UpdateAddress(addressUpdate);
  }

}
///doctor
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

///Schedule
final scheduleControllerProvider = Provider((ref) => ScheduleController(scheduleRepository: ref.watch(ScheduleRepositoryProvider)));

class ScheduleController{
  final ScheduleRepository _scheduleRepository;
  ScheduleController({required ScheduleRepository scheduleRepository}): _scheduleRepository= scheduleRepository;

  addBookingData( drmodel){
    _scheduleRepository.addbooking(drmodel: drmodel);

  }

}

///ambulance
final AmbulanceControllerProvider = Provider((ref) => AmbulanceController(ambulanceRepository: ref.watch(AmbulanceRepositoryProvider)));
final StreamAmbulanceProvider = StreamProvider((ref) => ref.watch(AmbulanceControllerProvider).StreamAmbulanceData());

class AmbulanceController {
  final AmbulanceRepository _ambulanceRepository;

  AmbulanceController({required AmbulanceRepository ambulanceRepository})
      : _ambulanceRepository= ambulanceRepository;

  addAmbulanceData(AmbulanceModel ambulanceAdd) {
    _ambulanceRepository.add(ambulanceAdd);
  }

  Stream StreamAmbulanceData() {
    return _ambulanceRepository.streamAmbulance();
  }

  deleteData(AmbulanceModel ambulanceDelete) {
    _ambulanceRepository.deleteAmbulance(ambulanceDelete);
  }

  updateData(AmbulanceModel ambulanceUpdate) {
    _ambulanceRepository.UpdateAmbulance(ambulanceUpdate);
  }
}