// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completion_req.f.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CompletionReq _$$_CompletionReqFromJson(Map<String, dynamic> json) =>
    _$_CompletionReq(
      model: json['model'] as String? ?? 'gpt-3.5-turbo',
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      temperature: (json['temperature'] as num?)?.toDouble() ?? 1,
      top_p: (json['top_p'] as num?)?.toDouble() ?? 1,
      n: json['n'] as int? ?? 1,
      max_tokens: json['max_tokens'] as int? ?? 2048,
      presence_penalty: (json['presence_penalty'] as num?)?.toDouble() ?? 1,
      frequency_penalty: (json['frequency_penalty'] as num?)?.toDouble() ?? 1,
      logit_bias: json['logit_bias'] as String?,
      user: json['user'] as String?,
    );

Map<String, dynamic> _$$_CompletionReqToJson(_$_CompletionReq instance) {
  final val = <String, dynamic>{
    'model': instance.model,
    'messages': instance.messages.map((e) => e.toJson()).toList(),
    'temperature': instance.temperature,
    'top_p': instance.top_p,
    'n': instance.n,
    'max_tokens': instance.max_tokens,
    'presence_penalty': instance.presence_penalty,
    'frequency_penalty': instance.frequency_penalty,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logit_bias', instance.logit_bias);
  writeNotNull('user', instance.user);
  return val;
}
