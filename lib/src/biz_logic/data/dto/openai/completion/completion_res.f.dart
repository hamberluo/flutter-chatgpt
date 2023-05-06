import 'package:cogni_chat/src/biz_logic/data/dto/openai/completion/choice/choice.f.dart';
import 'package:cogni_chat/src/biz_logic/data/dto/openai/usage/usage.f.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'completion_res.f.freezed.dart';

part 'completion_res.f.g.dart';

@freezed
class CompletionRes with _$CompletionRes {
  const factory CompletionRes({
    required String id,
    /// chat.completion
    required String object,
    required String model,
    required int created,
    @Default(<Choice>[]) List<Choice> choices,
    required Usage usage,
  }) = _CompletionRes;

  factory CompletionRes.fromJson(Map<String, dynamic> json) => _$CompletionResFromJson(json);
}
