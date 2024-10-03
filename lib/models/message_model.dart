class MessageModel {
  final String id;
  final String senderId;
  final String receiverId;
  final String senderEmail;
  final String receiverEmail;
  final String text;
  // final String doctorId;
  final String chatId;
  final DateTime timestamp;
  final bool isDeleted;

  MessageModel({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.senderEmail,
    required this.receiverEmail,
    required this.text,
    // required this.doctorId,
    required this.chatId,
    required this.timestamp,
    this.isDeleted = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'senderEmail': senderEmail,
      'receiverEmail': receiverEmail,
      'text': text,
      // 'doctorId': doctorId,
      'chatId': chatId,
      'timestamp': timestamp.toIso8601String(),
      'isDeleted': isDeleted,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map, String id) {
    return MessageModel(
      id: id,
      senderId: map['senderId'],
      receiverId: map['receiverId'],
      senderEmail: map['senderEmail'],
      receiverEmail: map['receiverEmail'],
      text: map['text'],
      // doctorId: map['doctorId'],
      chatId: map['chatId'],
      timestamp: DateTime.parse(map['timestamp']),
      isDeleted: map['isDeleted'] ?? false,
    );
  }
}
