import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical/models/message_model.dart';

class ChatRepository {
  final FirebaseFirestore firestore;

  ChatRepository(this.firestore);

  Future<void> sendMessage(MessageModel message) async {
    await firestore
        .collection('chats')
        .doc(message.senderId)
        .collection('messages')
        .add(message.toMap());
  }

  Stream<List<MessageModel>> getMessages(String receiverId) {
    return firestore
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .where('isDeleted', isEqualTo: false)
        .orderBy('timestamp')
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => MessageModel.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList());
  }

  Future<void> softDeleteMessage(String messageId) async {
    await firestore.collection('chats').doc(messageId).update({
      'isDeleted': true,
    });
  }

}
