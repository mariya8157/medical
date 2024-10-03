import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../controller/chat_controller.dart';
import '../repository/chat_repository.dart';

final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  return ChatRepository(FirebaseFirestore.instance);
});

final chatControllerProvider = Provider<ChatController>((ref) {
  final repository = ref.watch(chatRepositoryProvider);
  return ChatController(repository);
});
