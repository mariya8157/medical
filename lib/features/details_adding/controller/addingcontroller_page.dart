import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/adding_repository.dart';

final AddingControllerProvider = Provider((ref) => AddingController(addingRepository: ref.watch(AddingRepositoryProvider)));

class AddingController{
  final AddingRepository _addingRepository;
  AddingController({required AddingRepository addingRepository}): _addingRepository= addingRepository;

  addUserData(name, email, password){
    _addingRepository.add(name, email, password);
  }

}