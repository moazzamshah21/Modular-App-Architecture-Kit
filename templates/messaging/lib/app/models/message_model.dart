class MessageModel {
  const MessageModel({
    required this.id,
    required this.senderId,
    required this.text,
    required this.createdAt,
    this.isMe = false,
  });

  final String id;
  final String senderId;
  final String text;
  final DateTime createdAt;
  final bool isMe;

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] as String? ?? '',
      senderId: map['senderId'] as String? ?? '',
      text: map['text'] as String? ?? '',
      createdAt: map['createdAt'] != null
          ? DateTime.tryParse(map['createdAt'].toString()) ?? DateTime.now()
          : DateTime.now(),
      isMe: map['isMe'] as bool? ?? false,
    );
  }
}
