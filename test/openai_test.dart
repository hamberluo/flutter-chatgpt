// ignore_for_file: avoid_print

import 'package:cogni_chat/src/biz_logic/data/api/const.dart';
import 'package:cogni_chat/src/biz_logic/data/api/openai_client.dart';
import 'package:cogni_chat/src/biz_logic/data/dto/openai/completion/completion_req.f.dart';
import 'package:cogni_chat/src/biz_logic/data/dto/openai/completion/message/message.f.dart';
import 'package:cogni_chat/src/common_logic/util/json.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final client = OpenAIClient()
    ..init(baseUrl: openAiBaseUrl)
    ..setApiKey(testApiKey);
  group('chat', () {
    test('completion', () async {
      final res = await client.chatCompletions(
        const CompletionReq(
          max_tokens: 50,
          messages: [
            Message(
              role: 'system',
              content: 'You are a helpful assistant.',
            ),
            Message(
              role: 'user',
              content: 'Who won the world series in 2020?',
            ),
            Message(
              role: 'assistant',
              content: 'The Los Angeles Dodgers won the World Series in 2020.',
            ),
            Message(
              role: 'user',
              content: 'Where was it played?',
            ),
          ],
        ),
      );
      print('completion res:');
      print(jsonFormat(res));
    });
  });
}
