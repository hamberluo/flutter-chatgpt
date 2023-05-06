import 'package:cogni_chat/src/biz_logic/data/api/openai.dart';
import 'package:cogni_chat/src/biz_logic/data/dto/openai/completion/completion_req.f.dart';
import 'package:cogni_chat/src/biz_logic/data/dto/openai/completion/completion_res.f.dart';
import 'package:cogni_chat/src/common_logic/network/network_helper.dart';

class OpenAIClient implements OpenAI {
  String? _apiKey;
  late NetworkHelper _networkHelper;

  @override
  void setApiKey(String apiKey) {
    _apiKey = apiKey;
  }

  @override
  void init({required String baseUrl}) {
    _networkHelper = NetworkHelper(baseUrl: baseUrl);
  }

  @override
  Future<CompletionRes> chatCompletions(CompletionReq req) async {
    return _networkHelper.post(
      '/chat/completions',
      data: req.toJson(),
      headers: {'Authorization': 'Bearer $_apiKey'},
      parser: CompletionRes.fromJson,
    );
  }
}
