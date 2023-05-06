import 'package:cogni_chat/src/biz_logic/data/dto/openai/completion/completion_req.f.dart';
import 'package:cogni_chat/src/biz_logic/data/repo/openai/openai_repo.dart';
import 'package:cogni_chat/src/biz_ui/bloc/bean/chat/chat_message.dart';
import 'package:cogni_chat/src/biz_ui/bloc/bean/chat/gpt_message.dart';
import 'package:cogni_chat/src/biz_ui/bloc/bean/chat/user_message.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatNotifier extends StateNotifier<List<ChatMessage>> {
  ChatNotifier() : super([]);

  bool isQuerying() {
    if (state.isEmpty) return false;
    if (state.last is GptMessage) {
      return (state.last as GptMessage).isQuerying;
    }
    return false;
  }

  Future<bool> query(String? prompt) {
    state = [
      ...state,
      if (prompt != null) UserMessage(message: prompt),
      GptMessage.querying(),
    ];
    return answer();
  }

  Future<bool> answer() async {
    try {
      final style = await openAiRepo.getConversationStyle();
      final lastSix = state.length >= 6 ? state.sublist(state.length - 6, state.length) : state;
      final messageList = lastSix.map((e) => e.toMessage()).toList(growable: false);
      final res = await openAiRepo.chatCompletions(
        CompletionReq(
          messages: messageList,
          max_tokens: 2048,
          temperature: CompletionReqExt.temperatureFromStyle(style),
        ),
      );
      state = [
        ...state.sublist(0, state.length - 1),
        GptMessage.message(res.choices.first.message.content),
      ];
      return true;
    } catch (e) {
      state = [
        ...state.sublist(0, state.length - 1),
      ];
      return false;
    }
  }
}
