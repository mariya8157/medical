import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../order_repository/schedule_repository.dart';

final scheduleControllerProvider = Provider((ref) => ScheduleController(
    scheduleRepository: ref.watch(ScheduleRepositoryProvider)));

class ScheduleController {
  final ScheduleRepository _scheduleRepository;

  ScheduleController({required ScheduleRepository scheduleRepository})
      : _scheduleRepository = scheduleRepository;

  addBookingData(drmodel) {
    _scheduleRepository.addbooking(drmodel: drmodel);
  }
}
