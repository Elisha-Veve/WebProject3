import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zanpakuto/models/chat_member_model.dart';
import 'package:zanpakuto/models/chat_model.dart';
import 'package:zanpakuto/models/user_model.dart';

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
        title: Text(item.name ?? "Name"),
        subtitle: Row(children: [
          Expanded(
              child: Text(
            item.lastMessage?.message ?? "",
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          )),
          Text(item.updatedAt.toString())
        ]),
        onTap: () {
          onPressed(item);
        });
  }
}
