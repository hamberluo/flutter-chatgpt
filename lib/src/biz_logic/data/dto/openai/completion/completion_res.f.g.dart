// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completion_res.f.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CompletionRes _$$_CompletionResFromJson(Map<String, dynamic> json) =>
    _$_CompletionRes(
      id: json['id'] as String,
      object: json['object'] as String,
      model: json['model'] as String,
      created: json['created'] as int,
      choices: (json['choices'] as List<dynamic>?)
              ?.map((e) => Choice.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Choice>[],
      usage: Usage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CompletionResToJson(_$_CompletionRes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'model': instance.model,
      'created': instance.created,
      'choices': instance.choices.map((e) => e.toJson()).toList(),
      'usage': instance.usage.toJson(),
    };
