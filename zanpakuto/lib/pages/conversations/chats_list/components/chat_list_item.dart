import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zanpakuto/models/chat_model.dart';
import 'package:zanpakuto/models/user_model.dart';
import 'package:zanpakuto/utils/utils.dart';

class ChatListItem extends StatelessWidget {
  final ChatEntity item;
  final UserEntity currentUser;
  final void Function(ChatEntity) onPressed;
  const ChatListItem(
      {Key? key,
      required this.item,
      required this.currentUser,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const Icon(CupertinoIcons.person),
        title: Text(item.name ?? getChatName(item.members, currentUser)),
        subtitle: Row(children: [
          Expanded(
              child: Text(
            item.lastMessage?.message ?? "...",
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          )),
          Text(utcToLocal(item.updatedAt))
        ]),
        onTap: () {
          onPressed(item);
        });
  }
}
