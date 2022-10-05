import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zanpakuto/constants/controllers.dart';
import 'package:zanpakuto/routes/routes.dart';
import 'package:zanpakuto/utils/responsive_layout_screen.dart';

class ChatItem extends StatefulWidget {
  String name;
  String lastMessage;
  String lastMessageTime;
  bool lastMessageSentbyMe = false;

  ChatItem({
    Key? key,
    required this.name,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.lastMessageSentbyMe,
  }) : super(key: key);

  @override
  State<ChatItem> createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            // backgroundImage: const AssetImage('assets/images/user_2.png'),
            backgroundColor: Colors.white60,
          ),
          title: Text(
            widget.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(widget.lastMessage),
          trailing: Text(widget.lastMessageTime),
          onTap: () {
            // Get.toNamed(Routes.CHAT);
          },
        ),
      ),
    );
  }
}
