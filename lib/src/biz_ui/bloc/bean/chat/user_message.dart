import 'package:cogni_chat/src/biz_logic/data/dto/openai/completion/message/message.f.dart';
import 'package:cogni_chat/src/biz_ui/bloc/bean/chat/chat_message.dart';

class UserMessage extends ChatMessage {
  const UserMessage({
    required super.message,
  });

  @override
  Message toMessage() => Message(
        content: message,
        role: 'user',
      );
}
