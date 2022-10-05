import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zanpakuto/pages/conversations/chats_list/components/chat_item.dart';

class MainSubmissions extends StatefulWidget {
  const MainSubmissions({Key? key}) : super(key: key);

  @override
  State<MainSubmissions> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainSubmissions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submissions'),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            color: Colors.blue,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 160.0,
                  color: Colors.red,
                ),
                Container(
                  width: 160.0,
                  color: Colors.blue,
                ),
                Container(
                  width: 160.0,
                  color: Colors.green,
                ),
                Container(
                  width: 160.0,
                  color: Colors.yellow,
                ),
                Container(
                  width: 160.0,
                  color: Colors.orange,
                ),
                Container(
                  width: 160.0,
                  color: Colors.red,
                ),
                Container(
                  width: 160.0,
                  color: Colors.blue,
                ),
                Container(
                  width: 160.0,
                  color: Colors.green,
                ),
                Container(
                  width: 160.0,
                  color: Colors.yellow,
                ),
                Container(
                  width: 160.0,
                  color: Colors.orange,
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              ChatItem(
                name: "John Doe",
                lastMessage: "Hello",
                lastMessageTime: "12:00",
                lastMessageSentbyMe: true,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
