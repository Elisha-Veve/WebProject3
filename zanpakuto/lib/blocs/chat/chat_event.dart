part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.started() = ChatStarted;
  const factory ChatEvent.reset() = ChatReset;
  const factory ChatEvent.userSelected(UserEntity user) = UserSelected;
  const factory ChatEvent.getChatMessage() = GetChatMessage;
  const factory ChatEvent.loadMoreChatMessage() = LoadMoreChatMessage;
  const factory ChatEvent.sendMessage(int chatId, ChatMessage message) =
      SendMessage;
}
