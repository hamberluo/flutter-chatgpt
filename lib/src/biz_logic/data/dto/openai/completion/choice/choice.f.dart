// ignore_for_file: non_constant_identifier_names

import 'package:cogni_chat/src/biz_logic/data/dto/openai/completion/message/message.f.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'choice.f.freezed.dart';

part 'choice.f.g.dart';

@freezed
class Choice with _$Choice {
  const factory Choice({
    required int index,
    required String finish_reason,
    required Message message,
  }) = _Choice;

  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);
}
