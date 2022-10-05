import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zanpakuto/models/user_model.dart';

part 'chat_member_model.freezed.dart';
part 'chat_member_model.g.dart';

@freezed
class ChatMemberEntity with _$ChatMemberEntity {
  factory ChatMemberEntity({
    required int id,
    @JsonKey(name: "chat_id") required int chatId,
    @JsonKey(name: "user_id") required int userId,
    required UserEntity user,
  }) = _ChatMemberEntity;

  factory ChatMemberEntity.fromJson(Map<String, dynamic> json) =>
      _$ChatMemberEntityFromJson(json);
}
