import 'package:cogni_chat/src/biz_logic/data/dto/openai/completion/message/message.f.dart';
import 'package:cogni_chat/src/biz_ui/bloc/bean/chat/chat_message.dart';

class GptMessage extends ChatMessage {
  const GptMessage({
    required super.message,
    required this.isQuerying,
  });

  factory GptMessage.querying() => const GptMessage(message: '', isQuerying: true);

  factory GptMessage.message(String message) => GptMessage(message: message, isQuerying: false);

  final bool isQuerying;

  @override
  Message toMessage() => Message(
      content: message,
      role: 'assistant',
    );
}
