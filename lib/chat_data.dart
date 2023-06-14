
enum ChatMessageType{
  sent,
  received,
}


class ChatData{
  ChatMessageType type;
  String message;

  ChatData(this.type, this.message);
}