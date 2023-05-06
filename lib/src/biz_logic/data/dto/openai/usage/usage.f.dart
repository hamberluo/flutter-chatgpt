// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'usage.f.freezed.dart';

part 'usage.f.g.dart';

@freezed
class Usage with _$Usage {
  const factory Usage({
    required int prompt_tokens,
    required int completion_tokens,
    required int total_tokens,
  }) = _Usage;

  factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);
}
