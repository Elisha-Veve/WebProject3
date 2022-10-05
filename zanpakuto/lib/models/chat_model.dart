import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zanpakuto/models/chat_member_model.dart';
import 'package:zanpakuto/models/chat_message_model.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
class ChatEntity with _$ChatEntity {
  factory ChatEntity({
    required int id,
    required String? name,
    @JsonKey(name: "created_at") required DateTime createdAt,
    @JsonKey(name: "updated_at") required DateTime updatedAt,
    @JsonKey(name: "is_group_chat") required bool isGroupChat,
    ChatMessageEntity? lastMessage,
    @JsonKey(name: "chat_members") required List<ChatMemberEntity> members,
  }) = _ChatEntity;

  factory ChatEntity.fromJson(Map<String, dynamic> json) =>
      _$ChatEntityFromJson(json);
}
