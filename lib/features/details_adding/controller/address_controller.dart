import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/address_model.dart';
import '../../../models/medicine_model.dart';
import '../repository/address_repository.dart';

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
  updatecart(AddressModel addressModel,MedicineModel medicineModel){
    _addressRepository.updateCart(addressModel, medicineModel);
  }
}
