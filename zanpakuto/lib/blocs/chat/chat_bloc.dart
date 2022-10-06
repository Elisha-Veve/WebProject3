import 'package:bloc/bloc.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zanpakuto/enums/enums.dart';
import 'package:zanpakuto/models/models.dart';
import 'package:zanpakuto/models/requests/create_chat_request.dart';
import 'package:zanpakuto/models/requests/requests.dart';
import 'package:zanpakuto/repositories/repositories.dart';
import 'package:zanpakuto/utils/utils.dart';

part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository _chatRepository;
  final ChatMessageRepository _chatMessageRepository;

  ChatBloc({
    required ChatRepository chatRepository,
    required ChatMessageRepository chatMessageRepository,
  })  : _chatRepository = chatRepository,
        _chatMessageRepository = chatMessageRepository,
        super(ChatState.initial()) {
    on<ChatStarted>((event, emit) async {
      if (state.status.isLoading) return;
      emit(state.copyWith(status: DataStatus.loading));

      final result = await _chatRepository.getChats();

      emit(state.copyWith(
        status: DataStatus.loaded,
        chats: result.success ? result.data ?? [] : [],
        message: result.message,
      ));
    });
    on<ChatReset>((event, emit) async {
      emit(state.copyWith(
          chatMessages: [],
          message: "",
          status: DataStatus.initial,
          selectedChat: null,
          otherUserId: null,
          isLastPage: false,
          page: 1,
          chats: (event.shouldResetChat != null && event.shouldResetChat!)
              ? []
              : state.chats));
    });

    on<UserSelected>((event, emit) async {
      vLog("Message from chat bloc");
      vLog(event.user);
      vLog("Message from chat bloc");
      emit(state.copyWith(otherUserId: event.user.id));
      // emit(state.copyWith(selectedChat: event.user));
    });

    on<ChatSelected>((event, emit) async {
      emit(state.copyWith(selectedChat: event.chat));
    });

    on<GetChatMessage>((event, emit) async {
      if (state.status.isFetching) return;

      emit(state.copyWith(status: DataStatus.fetching));

      ChatEntity? chat;

      if (state.isSearchChat) {
        vLog("Message from chat bloc 4");
        final chatResult = await _chatRepository.createChat(
          CreateChatRequest(userId: state.otherUserId!),
        );
        vLog("Message from chat bloc 5");
        vLog(chatResult);
        vLog("Message from chat bloc 6");
        if (chatResult.success) {
          vLog(chatResult.data);
          chat = chatResult.data;
        }
      } else if (state.isListChat) {
        chat = state.selectedChat;
      }

      if (chat == null) {
        emit(state.copyWith(
          status: DataStatus.loaded,
          chatMessages: [],
        ));
        return;
      }

      final result = await _chatMessageRepository.getChatMessages(
        chatId: chat.id,
        page: 1,
      );
      if (result.success) {
        emit(state.copyWith(
            chatMessages: result.data ?? [],
            status: DataStatus.loaded,
            selectedChat: chat));
      } else {
        emit(state.copyWith(
          status: DataStatus.error,
          chatMessages: [],
          message: result.message,
        ));
      }
    });

    on<SendMessage>(
      (event, emit) async {
        if (state.status.isSubmitting) return;
        emit(state.copyWith(status: DataStatus.submitting));

        final result = await _chatMessageRepository.createChatMessage(
            CreateChatMessageRequest(
                chatId: event.chatId, message: event.message.text));

        if (result.success) {
          final messages = [result.data!, ...state.chatMessages];
          emit(state.copyWith(
            status: DataStatus.loaded,
            chatMessages: messages,
          ));
        } else {
          emit(state.copyWith(
            status: DataStatus.loaded,
          ));
        }
      },
    );

    on<LoadMoreChatMessage>((event, emit) async {
      if (state.status.isLoadingMore || state.isLastPage) return;
      emit(state.copyWith(status: DataStatus.loadingMore));
      final newPage = state.page + 1;
      final result = await _chatMessageRepository.getChatMessages(
        chatId: state.selectedChat!.id,
        page: newPage,
      );
      if (result.success) {
        final newMessages = result.data ?? [];
        if (newMessages.isNotEmpty) {
          emit(state.copyWith(
            chatMessages: [...state.chatMessages, ...newMessages],
            status: DataStatus.loaded,
            page: newPage,
          ));
        } else {
          emit(state.copyWith(
            status: DataStatus.loaded,
            isLastPage: true,
          ));
        }
      } else {
        emit(state.copyWith(
          status: DataStatus.error,
          message: result.message,
        ));
      }
    });
  }
}
