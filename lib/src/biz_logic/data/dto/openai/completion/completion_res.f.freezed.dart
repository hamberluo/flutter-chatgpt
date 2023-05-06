// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'completion_res.f.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CompletionRes _$CompletionResFromJson(Map<String, dynamic> json) {
  return _CompletionRes.fromJson(json);
}

/// @nodoc
mixin _$CompletionRes {
  String get id => throw _privateConstructorUsedError;

  /// chat.completion
  String get object => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  int get created => throw _privateConstructorUsedError;
  List<Choice> get choices => throw _privateConstructorUsedError;
  Usage get usage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompletionResCopyWith<CompletionRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompletionResCopyWith<$Res> {
  factory $CompletionResCopyWith(
          CompletionRes value, $Res Function(CompletionRes) then) =
      _$CompletionResCopyWithImpl<$Res, CompletionRes>;
  @useResult
  $Res call(
      {String id,
      String object,
      String model,
      int created,
      List<Choice> choices,
      Usage usage});

  $UsageCopyWith<$Res> get usage;
}

/// @nodoc
class _$CompletionResCopyWithImpl<$Res, $Val extends CompletionRes>
    implements $CompletionResCopyWith<$Res> {
  _$CompletionResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? object = null,
    Object? model = null,
    Object? created = null,
    Object? choices = null,
    Object? usage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      choices: null == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<Choice>,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as Usage,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UsageCopyWith<$Res> get usage {
    return $UsageCopyWith<$Res>(_value.usage, (value) {
      return _then(_value.copyWith(usage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CompletionResCopyWith<$Res>
    implements $CompletionResCopyWith<$Res> {
  factory _$$_CompletionResCopyWith(
          _$_CompletionRes value, $Res Function(_$_CompletionRes) then) =
      __$$_CompletionResCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String object,
      String model,
      int created,
      List<Choice> choices,
      Usage usage});

  @override
  $UsageCopyWith<$Res> get usage;
}

/// @nodoc
class __$$_CompletionResCopyWithImpl<$Res>
    extends _$CompletionResCopyWithImpl<$Res, _$_CompletionRes>
    implements _$$_CompletionResCopyWith<$Res> {
  __$$_CompletionResCopyWithImpl(
      _$_CompletionRes _value, $Res Function(_$_CompletionRes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? object = null,
    Object? model = null,
    Object? created = null,
    Object? choices = null,
    Object? usage = null,
  }) {
    return _then(_$_CompletionRes(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      choices: null == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<Choice>,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as Usage,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CompletionRes implements _CompletionRes {
  const _$_CompletionRes(
      {required this.id,
      required this.object,
      required this.model,
      required this.created,
      final List<Choice> choices = const <Choice>[],
      required this.usage})
      : _choices = choices;

  factory _$_CompletionRes.fromJson(Map<String, dynamic> json) =>
      _$$_CompletionResFromJson(json);

  @override
  final String id;

  /// chat.completion
  @override
  final String object;
  @override
  final String model;
  @override
  final int created;
  final List<Choice> _choices;
  @override
  @JsonKey()
  List<Choice> get choices {
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

  @override
  final Usage usage;

  @override
  String toString() {
    return 'CompletionRes(id: $id, object: $object, model: $model, created: $created, choices: $choices, usage: $usage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CompletionRes &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.created, created) || other.created == created) &&
            const DeepCollectionEquality().equals(other._choices, _choices) &&
            (identical(other.usage, usage) || other.usage == usage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, object, model, created,
      const DeepCollectionEquality().hash(_choices), usage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CompletionResCopyWith<_$_CompletionRes> get copyWith =>
      __$$_CompletionResCopyWithImpl<_$_CompletionRes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompletionResToJson(
      this,
    );
  }
}

abstract class _CompletionRes implements CompletionRes {
  const factory _CompletionRes(
      {required final String id,
      required final String object,
      required final String model,
      required final int created,
      final List<Choice> choices,
      required final Usage usage}) = _$_CompletionRes;

  factory _CompletionRes.fromJson(Map<String, dynamic> json) =
      _$_CompletionRes.fromJson;

  @override
  String get id;
  @override

  /// chat.completion
  String get object;
  @override
  String get model;
  @override
  int get created;
  @override
  List<Choice> get choices;
  @override
  Usage get usage;
  @override
  @JsonKey(ignore: true)
  _$$_CompletionResCopyWith<_$_CompletionRes> get copyWith =>
      throw _privateConstructorUsedError;
}
