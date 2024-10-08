import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical/models/medicine_model.dart';
import 'package:medical/models/user_model.dart';
import '../auth_repository/user_repository.dart';

final AddingControllerProvider = Provider((ref) =>
    AddingController(addingRepository: ref.watch(AddingRepositoryProvider)));

class AddingController {
  final AddingRepository _addingRepository;

  AddingController({required AddingRepository addingRepository})
      : _addingRepository = addingRepository;

  addUserData(
      {required name,
      required email,
      required password,
      required id,
      required cart,
      required wish}) {
    _addingRepository.add(name, email, password, id, cart, wish);
  }

  addUser(name, email, password, id, cart, wish) {
    _addingRepository.addingUser(name, email, password, id, cart, wish);
  }

  updatecart(UsersModel usersModel, MedicineModel medicineModel) {
    _addingRepository.updateCart(usersModel, medicineModel);
  }

  updatewish(UsersModel usersModel, MedicineModel medicineModel) {
    _addingRepository.updateWish(usersModel, medicineModel);
  }
}
