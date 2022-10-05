// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_chat_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateChatRequest _$$_CreateChatRequestFromJson(Map<String, dynamic> json) =>
    _$_CreateChatRequest(
      userId: json['user_id'] as int,
      isGroupChat: json['is_group_chat'] as bool?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_CreateChatRequestToJson(
        _$_CreateChatRequest instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'is_group_chat': instance.isGroupChat,
      'name': instance.name,
    };
