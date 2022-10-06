import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:search_page/search_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:zanpakuto/blocs/blocs.dart';
import 'package:zanpakuto/blocs/chat/chat_bloc.dart';
import 'package:zanpakuto/blocs/user/user_bloc.dart';
import 'package:zanpakuto/models/models.dart';
import 'package:zanpakuto/pages/conversations/chat_page/chat_page.dart';
import 'package:zanpakuto/pages/conversations/chats_list/components/chat_list_item.dart';
import 'package:zanpakuto/pages/startup_container.dart';
import 'package:zanpakuto/utils/utils.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    final currentUser = authBloc.state.user!;
    final userBloc = context.read<UserBloc>();
    final chatBloc = context.read<ChatBloc>();

    return StartUp(
      onInit: () async {
        chatBloc.add(const ChatStarted());
        userBloc.add(const UserStarted());
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Chats"),
          ),
          body: Stack(children: [
            RefreshIndicator(
              onRefresh: () async {
                chatBloc.add(const ChatReset(null));
                chatBloc.add(const ChatStarted());
                userBloc.add(const UserStarted());
              },
              child: BlocConsumer<ChatBloc, ChatState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  if (state.chats.isEmpty) {
                    return Center(child: Text("No chats yet"));
                  }
                  return ListView.separated(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 80),
                    itemBuilder: (context, index) {
                      final item = state.chats[index];
                      return ChatListItem(
                          key: ValueKey(item.id),
                          item: item,
                          currentUser: currentUser,
                          onPressed: (chat) {
                            vLog(chat);
                          });
                    },
                    itemCount: state.chats.length,
                    separatorBuilder: (_, __) => const Divider(),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocSelector<UserBloc, UserState, List<UserEntity>>(
                selector: (state) {
                  return state.map(
                      initial: (_) => [], loaded: (state) => state.users);
                },
                builder: (context, state) {
                  dLog(state);
                  return FloatingActionButton(
                      onPressed: () {
                        _showSearch(context, state);
                      },
                      child: const Icon(CupertinoIcons.search));
                },
              ),
            )
          ])),
    );
  }

  void _showSearch(BuildContext context, List<UserEntity> users) {
    print("These are the users: $users");
    showSearch(
        context: context,
        delegate: SearchPage<UserEntity>(
          builder: (user) => ListTile(
            leading: Icon(CupertinoIcons.person),
            title: Text(user.username),
            subtitle: Text(user.email),
            onTap: () {
              vLog(user);
              vLog("message");
              context.read<ChatBloc>().add(UserSelected(user));
              // context.read<ChatBloc>().add()
              vLog(context.read<ChatBloc>().state);
              vLog("end message");
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(),
                ),
              );
            },
          ),
          filter: (user) => [user.email, user.username],
          items: users,
          searchLabel: "Search for a user",
          suggestion: Center(child: Text("Start typing to search")),
          failure: Center(child: Text("No user found :(")),
        ));
  }
}

// void getChatList() async {
//   SharedPreferences localStorage = await SharedPreferences.getInstance();
//   var token = localStorage.getString('token');
//   var user = localStorage.getString('user');
//   // var res = await CallApi().getData('chat');
//   print(user);
// }
