import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.f.freezed.dart';

part 'message.f.g.dart';

@freezed
class Message with _$Message {
  const factory Message({
    /// system | user | assistant
    required String role,
    required String content,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}
