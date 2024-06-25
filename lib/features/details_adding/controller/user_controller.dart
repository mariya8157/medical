import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical/models/model1.dart';

import '../../../models/ambulanceModel.dart';
import '../../../models/doctormodel.dart';
import '../../../models/model2.dart';
import '../repository/address_repository.dart';
import '../repository/ambulance_repository.dart';
import '../repository/doctor_repository.dart';
import '../repository/schedule_repository.dart';
import '../repository/user_repository.dart';

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




