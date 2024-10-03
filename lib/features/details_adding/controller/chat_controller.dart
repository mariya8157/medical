import 'package:medical/models/message_model.dart';

import '../repository/chat_repository.dart';

class ChatController {
  final ChatRepository repository;

  ChatController(this.repository);

  Future<void> sendMessage(String doctorId, String senderId, String receiverId, String text, String chatId, String senderEmail, String receiverEmail) async {
    final message = MessageModel(
        id: '',
        senderId: senderId,
        receiverId: receiverId,
        text: text,
        timestamp: DateTime.now(),
        chatId: chatId,
        isDeleted: false,
        senderEmail: senderEmail,
        receiverEmail: receiverEmail,
    );
    await repository.sendMessage(doctorId, message);
  }

  Stream<List<MessageModel>> getMessages(String chatId, String doctorId) {
    return repository.getMessages(chatId, doctorId);
  }

  Future<void> deleteMessage(String messageId) async {
    await repository.softDeleteMessage(messageId);
  }
}
