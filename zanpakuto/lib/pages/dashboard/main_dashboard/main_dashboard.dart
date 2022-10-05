import 'package:flutter/material.dart';
import 'package:zanpakuto/pages/conversations/chats_list/components/chat_item.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({Key? key}) : super(key: key);

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Column(
        children: [
          Container(
            height: 80,
            color: Colors.white10,
            child: Text(
              'Main Dashboard',
              style: TextStyle(fontSize: 40),
            ),
          ),
          Expanded(
            child: ListView(children: [
              ChatItem(
                name: "John Doe",
                lastMessage: "Hello",
                lastMessageTime: "12:00",
                lastMessageSentbyMe: true,
              ),
              ChatItem(
                name: "John Doe",
                lastMessage: "Hello",
                lastMessageTime: "12:00",
                lastMessageSentbyMe: true,
              ),
              ChatItem(
                name: "John Doe",
                lastMessage: "Hello",
                lastMessageTime: "12:00",
                lastMessageSentbyMe: true,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
