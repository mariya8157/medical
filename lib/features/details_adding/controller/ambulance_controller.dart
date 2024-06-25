import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/ambulance_model.dart';
import '../repository/ambulance_repository.dart';

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