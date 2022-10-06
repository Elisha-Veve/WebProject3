import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanpakuto/blocs/blocs.dart';
import 'package:zanpakuto/constants/controllers.dart';
import 'package:zanpakuto/models/models.dart';
import 'package:zanpakuto/pages/conversations/chat_page/data.dart';
import 'package:zanpakuto/pages/startup_container.dart';
import 'package:zanpakuto/utils/utils.dart';

import '../../../blocs/chat/chat_bloc.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // List<ChatMessage> messages = basicSample;

  @override
  Widget build(BuildContext context) {
    final chatBloc = context.read<ChatBloc>();
    final authBloc = context.read<AuthBloc>();
    return StartUp(
      onDisposed: () {
        chatBloc.add(const ChatReset(null));
        chatBloc.add(const ChatStarted());
      },
      onInit: () {
        chatBloc.add(const GetChatMessage());
        menuController.hideBottomBar();
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            title: BlocConsumer<ChatBloc, ChatState>(
              listener: (context, state) {},
              builder: (context, state) {
                final chat = state.selectedChat;
                vLog(chat);
                // vLog(state.chats);
                return Text(chat == null
                    ? "N/A"
                    : getChatName(chat.members, authBloc.state.user!));
              },
            ),
          ),
          body: BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              // vLog(state.chatMessages);
              return DashChat(
                currentUser: authBloc.state.user!.toChatUser,
                onSend: (ChatMessage chatMessage) {
                  chatBloc
                      .add(SendMessage(state.selectedChat!.id, chatMessage));
                },
                messages: state.uiMessages,
                messageListOptions: MessageListOptions(onLoadEarlier: () async {
                  chatBloc.add(const LoadMoreChatMessage());
                }),
              );
            },
          )),
    );
  }

  void _sendMessage() {
    // if (_controller.text.isNotEmpty) {
    //   _channel.sink.add(_controller.text);
    //   _controller.text = '';
    // }
  }

  @override
  void dispose() {
    // _channel.sink.close();
    // _controller.dispose();
    // super.dispose();
  }
}

class Message {
  final String text;
  final DateTime date;
  final UserEntity user;

  Message({required this.text, required this.date, required this.user});
}
