import 'package:cogni_chat/src/biz_logic/data/dto/openai/completion/completion_req.f.dart';
import 'package:cogni_chat/src/biz_logic/data/dto/openai/completion/completion_res.f.dart';

abstract class Repo {
  void initApiKey();

  void setApiKey(String apiKey);

  Future<String> getApiKey();

  void setConversationStyle(int conversationStyle);

  Future<int> getConversationStyle();

  Future<CompletionRes> chatCompletions(CompletionReq req);


}
