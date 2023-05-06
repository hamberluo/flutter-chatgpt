// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usage.f.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Usage _$$_UsageFromJson(Map<String, dynamic> json) => _$_Usage(
      prompt_tokens: json['prompt_tokens'] as int,
      completion_tokens: json['completion_tokens'] as int,
      total_tokens: json['total_tokens'] as int,
    );

Map<String, dynamic> _$$_UsageToJson(_$_Usage instance) => <String, dynamic>{
      'prompt_tokens': instance.prompt_tokens,
      'completion_tokens': instance.completion_tokens,
      'total_tokens': instance.total_tokens,
    };
