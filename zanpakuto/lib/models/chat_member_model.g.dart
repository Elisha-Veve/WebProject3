// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatMemberEntity _$$_ChatMemberEntityFromJson(Map<String, dynamic> json) =>
    _$_ChatMemberEntity(
      id: json['id'] as int,
      chatId: json['chat_id'] as int,
      userId: json['user_id'] as int,
      user: UserEntity.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ChatMemberEntityToJson(_$_ChatMemberEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chat_id': instance.chatId,
      'user_id': instance.userId,
      'user': instance.user,
    };
