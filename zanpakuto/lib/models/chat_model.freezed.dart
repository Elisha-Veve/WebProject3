// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatEntity _$ChatEntityFromJson(Map<String, dynamic> json) {
  return _ChatEntity.fromJson(json);
}

/// @nodoc
mixin _$ChatEntity {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "is_group_chat")
  bool get isGroupChat => throw _privateConstructorUsedError;
  ChatMessageEntity? get lastMessage => throw _privateConstructorUsedError;
  @JsonKey(name: "chat_members")
  List<ChatMemberEntity> get members => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatEntityCopyWith<ChatEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatEntityCopyWith<$Res> {
  factory $ChatEntityCopyWith(
          ChatEntity value, $Res Function(ChatEntity) then) =
      _$ChatEntityCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(name: "created_at") DateTime createdAt,
      @JsonKey(name: "updated_at") DateTime updatedAt,
      @JsonKey(name: "is_group_chat") bool isGroupChat,
      ChatMessageEntity? lastMessage,
      @JsonKey(name: "chat_members") List<ChatMemberEntity> members});

  $ChatMessageEntityCopyWith<$Res>? get lastMessage;
}

/// @nodoc
class _$ChatEntityCopyWithImpl<$Res> implements $ChatEntityCopyWith<$Res> {
  _$ChatEntityCopyWithImpl(this._value, this._then);

  final ChatEntity _value;
  // ignore: unused_field
  final $Res Function(ChatEntity) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isGroupChat = freezed,
    Object? lastMessage = freezed,
    Object? members = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isGroupChat: isGroupChat == freezed
          ? _value.isGroupChat
          : isGroupChat // ignore: cast_nullable_to_non_nullable
              as bool,
      lastMessage: lastMessage == freezed
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as ChatMessageEntity?,
      members: members == freezed
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<ChatMemberEntity>,
    ));
  }

  @override
  $ChatMessageEntityCopyWith<$Res>? get lastMessage {
    if (_value.lastMessage == null) {
      return null;
    }

    return $ChatMessageEntityCopyWith<$Res>(_value.lastMessage!, (value) {
      return _then(_value.copyWith(lastMessage: value));
    });
  }
}

/// @nodoc
abstract class _$$_ChatEntityCopyWith<$Res>
    implements $ChatEntityCopyWith<$Res> {
  factory _$$_ChatEntityCopyWith(
          _$_ChatEntity value, $Res Function(_$_ChatEntity) then) =
      __$$_ChatEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(name: "created_at") DateTime createdAt,
      @JsonKey(name: "updated_at") DateTime updatedAt,
      @JsonKey(name: "is_group_chat") bool isGroupChat,
      ChatMessageEntity? lastMessage,
      @JsonKey(name: "chat_members") List<ChatMemberEntity> members});

  @override
  $ChatMessageEntityCopyWith<$Res>? get lastMessage;
}

/// @nodoc
class __$$_ChatEntityCopyWithImpl<$Res> extends _$ChatEntityCopyWithImpl<$Res>
    implements _$$_ChatEntityCopyWith<$Res> {
  __$$_ChatEntityCopyWithImpl(
      _$_ChatEntity _value, $Res Function(_$_ChatEntity) _then)
      : super(_value, (v) => _then(v as _$_ChatEntity));

  @override
  _$_ChatEntity get _value => super._value as _$_ChatEntity;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isGroupChat = freezed,
    Object? lastMessage = freezed,
    Object? members = freezed,
  }) {
    return _then(_$_ChatEntity(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isGroupChat: isGroupChat == freezed
          ? _value.isGroupChat
          : isGroupChat // ignore: cast_nullable_to_non_nullable
              as bool,
      lastMessage: lastMessage == freezed
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as ChatMessageEntity?,
      members: members == freezed
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<ChatMemberEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatEntity implements _ChatEntity {
  _$_ChatEntity(
      {required this.id,
      @JsonKey(name: "created_at")
          required this.createdAt,
      @JsonKey(name: "updated_at")
          required this.updatedAt,
      @JsonKey(name: "is_group_chat")
          required this.isGroupChat,
      this.lastMessage,
      @JsonKey(name: "chat_members")
          required final List<ChatMemberEntity> members})
      : _members = members;

  factory _$_ChatEntity.fromJson(Map<String, dynamic> json) =>
      _$$_ChatEntityFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  @override
  @JsonKey(name: "is_group_chat")
  final bool isGroupChat;
  @override
  final ChatMessageEntity? lastMessage;
  final List<ChatMemberEntity> _members;
  @override
  @JsonKey(name: "chat_members")
  List<ChatMemberEntity> get members {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  String toString() {
    return 'ChatEntity(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, isGroupChat: $isGroupChat, lastMessage: $lastMessage, members: $members)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatEntity &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality()
                .equals(other.isGroupChat, isGroupChat) &&
            const DeepCollectionEquality()
                .equals(other.lastMessage, lastMessage) &&
            const DeepCollectionEquality().equals(other._members, _members));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(isGroupChat),
      const DeepCollectionEquality().hash(lastMessage),
      const DeepCollectionEquality().hash(_members));

  @JsonKey(ignore: true)
  @override
  _$$_ChatEntityCopyWith<_$_ChatEntity> get copyWith =>
      __$$_ChatEntityCopyWithImpl<_$_ChatEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatEntityToJson(
      this,
    );
  }
}

abstract class _ChatEntity implements ChatEntity {
  factory _ChatEntity(
      {required final int id,
      @JsonKey(name: "created_at")
          required final DateTime createdAt,
      @JsonKey(name: "updated_at")
          required final DateTime updatedAt,
      @JsonKey(name: "is_group_chat")
          required final bool isGroupChat,
      final ChatMessageEntity? lastMessage,
      @JsonKey(name: "chat_members")
          required final List<ChatMemberEntity> members}) = _$_ChatEntity;

  factory _ChatEntity.fromJson(Map<String, dynamic> json) =
      _$_ChatEntity.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: "created_at")
  DateTime get createdAt;
  @override
  @JsonKey(name: "updated_at")
  DateTime get updatedAt;
  @override
  @JsonKey(name: "is_group_chat")
  bool get isGroupChat;
  @override
  ChatMessageEntity? get lastMessage;
  @override
  @JsonKey(name: "chat_members")
  List<ChatMemberEntity> get members;
  @override
  @JsonKey(ignore: true)
  _$$_ChatEntityCopyWith<_$_ChatEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
