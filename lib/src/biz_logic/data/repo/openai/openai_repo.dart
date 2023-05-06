import 'package:cogni_chat/src/biz_logic/data/api/const.dart';
import 'package:cogni_chat/src/biz_logic/data/api/openai.dart';
import 'package:cogni_chat/src/biz_logic/data/api/openai_client.dart';
import 'package:cogni_chat/src/biz_logic/data/dto/openai/completion/completion_req.f.dart';
import 'package:cogni_chat/src/biz_logic/data/dto/openai/completion/completion_res.f.dart';
import 'package:cogni_chat/src/biz_logic/data/repo/openai/repo.dart';
import 'package:cogni_chat/src/common_logic/storage/storage.dart';

final openAiRepo = OpenAiRepo(
  OpenAIClient()
    ..init(
      baseUrl: openAiBaseUrl,
    ),
);

class OpenAiRepo implements Repo {
  OpenAiRepo(this._api);

  final OpenAI _api;

  static const openaiApiKey = 'openai_apiKey';
  static const conversationStyleKey = 'openai_conversationStyleKey';

  @override
  void initApiKey() {
    storage.get(OpenAiRepo.openaiApiKey, defaultValue: '').then(
      (value) {
        if (value.isNotEmpty) {
          _api.setApiKey(value);
        }
      },
    );
  }

  @override
  void setApiKey(String apiKey) {
    if (apiKey.isEmpty) return;
    _api.setApiKey(apiKey);
    storage.set(openaiApiKey, apiKey);
  }

  @override
  Future<String> getApiKey() {
    return storage.get(openaiApiKey, defaultValue: '');
  }

  @override
  Future<CompletionRes> chatCompletions(CompletionReq req) {
    return _api.chatCompletions(req);
  }

  @override
  Future<int> getConversationStyle() {
    return storage.get(conversationStyleKey, defaultValue: 1);
  }

  @override
  void setConversationStyle(int conversationStyle) {
    storage.set(conversationStyleKey, conversationStyle);
  }
}
