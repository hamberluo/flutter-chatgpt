import 'package:cogni_chat/src/biz_logic/data/dto/openai/completion/message/message.f.dart';

abstract class ChatMessage {
  const ChatMessage({
    required this.message,
  });

  final String message;

  Message toMessage();
}
