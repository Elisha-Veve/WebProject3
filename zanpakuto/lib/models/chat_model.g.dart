// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatEntity _$$_ChatEntityFromJson(Map<String, dynamic> json) =>
    _$_ChatEntity(
      id: json['id'] as int,
      name: json['name'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      isGroupChat: json['is_group_chat'] as bool,
      lastMessage: json['last_message'] == null
          ? null
          : ChatMessageEntity.fromJson(
              json['last_message'] as Map<String, dynamic>),
      members: (json['chat_members'] as List<dynamic>)
          .map((e) => ChatMemberEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ChatEntityToJson(_$_ChatEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'is_group_chat': instance.isGroupChat,
      'last_message': instance.lastMessage,
      'chat_members': instance.members,
    };
