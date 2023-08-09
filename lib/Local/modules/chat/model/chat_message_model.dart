class ChatMessageModel {
  final String message;
  final bool isSender;
  final String time;

  ChatMessageModel({
    required this.message,
    required this.isSender,
    required this.time,
  });
}
