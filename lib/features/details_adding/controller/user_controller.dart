import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical/models/user_model.dart';

import '../../../models/ambulance_model.dart';
import '../../../models/doctor_model.dart';
import '../../../models/address_model.dart';
import '../repository/address_repository.dart';
import '../repository/ambulance_repository.dart';
import '../repository/doctor_repository.dart';
import '../repository/schedule_repository.dart';
import '../repository/user_repository.dart';

final AddingControllerProvider = Provider((ref) => AddingController(addingRepository: ref.watch(AddingRepositoryProvider)));

class AddingController {
  final AddingRepository _addingRepository;

  AddingController({required AddingRepository addingRepository})
      : _addingRepository= addingRepository;

  addUserData(name, email, password, id) {
    _addingRepository.add(name, email, password, id);
  }

  addUser(name, email, password) {
    _addingRepository.addingUser(name, email, password);
  }
}
