class MessageModel {
  final String id;
  final String senderId;
  final String senderName;
  final String receiverId;
  final String receiverName;
  final String content;
  final DateTime timeStamp;
  final bool isSeen;

  MessageModel({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.receiverId,
    required this.receiverName,
    required this.content,
    required this.timeStamp,
    required this.isSeen,
  });

  static List<MessageModel> dummyMessages = [
    MessageModel(
      id: '1',
      senderId: '1',
      senderName: 'John Doe',
      receiverId: '2',
      receiverName: 'Alex',
      content: 'Hi Alex, I’m interested in renting one of your properties.',
      timeStamp: DateTime.now().subtract(Duration(hours: 15)),
      isSeen: true,
    ),
    MessageModel(
      id: '2',
      senderId: '2',
      senderName: 'Alex',
      receiverId: '1',
      receiverName: 'John Doe',
      content: 'Hi John, sure! Let me know which one you’re interested in.',
      timeStamp: DateTime.now().subtract(Duration(hours: 10)),
      isSeen: false,
    ),
    MessageModel(
      id: '3',
      senderId: '1',
      senderName: 'John Doe',
      receiverId: '2',
      receiverName: 'Alex',
      content: 'I liked the one on 5th Avenue. Is it still available?',
      timeStamp: DateTime.now().subtract(Duration(days: 5)),
      isSeen: false,
    ),
  ];
}
