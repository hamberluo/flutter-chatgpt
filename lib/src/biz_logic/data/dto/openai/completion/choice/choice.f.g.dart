// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choice.f.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Choice _$$_ChoiceFromJson(Map<String, dynamic> json) => _$_Choice(
      index: json['index'] as int,
      finish_reason: json['finish_reason'] as String,
      message: Message.fromJson(json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ChoiceToJson(_$_Choice instance) => <String, dynamic>{
      'index': instance.index,
      'finish_reason': instance.finish_reason,
      'message': instance.message.toJson(),
    };
