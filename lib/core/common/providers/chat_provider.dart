import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical/models/message_model.dart';
import '../../../features/screen/contacts/chat_controller/chat_controller.dart';
import '../../../features/screen/contacts/chat_repository/chat_repository.dart';

final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  return ChatRepository(FirebaseFirestore.instance);
});

final chatControllerProvider = Provider<ChatController>((ref) {
  final repository = ref.watch(chatRepositoryProvider);
  return ChatController(repository);
});

final doctorsStreamProvider = StreamProvider.family<List<MessageModel>, String>((ref, receiverId) {
  final chatRepository = ref.watch(chatRepositoryProvider);
  return chatRepository.streamDoctors(receiverId);
});