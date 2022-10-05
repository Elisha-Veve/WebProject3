// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatEntity _$$_ChatEntityFromJson(Map<String, dynamic> json) =>
    _$_ChatEntity(
      id: json['id'] as int,
      name: json['name'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      isGroupChat: json['is_group_chat'] as bool,
      lastMessage: json['lastMessage'] == null
          ? null
          : ChatMessageEntity.fromJson(
              json['lastMessage'] as Map<String, dynamic>),
      members: (json['members'] as List<dynamic>)
          .map((e) => ChatMemberEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ChatEntityToJson(_$_ChatEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'is_group_chat': instance.isGroupChat,
      'lastMessage': instance.lastMessage,
      'members': instance.members,
    };
