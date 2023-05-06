import 'package:cogni_chat/src/biz_logic/data/dto/openai/completion/completion_req.f.dart';
import 'package:cogni_chat/src/biz_logic/data/dto/openai/completion/completion_res.f.dart';

abstract class OpenAI {
  void init({required String baseUrl});

  void setApiKey(String apiKey);

  Future<CompletionRes> chatCompletions(CompletionReq req);
}
