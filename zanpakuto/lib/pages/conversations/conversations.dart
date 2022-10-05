import 'package:flutter/material.dart';
import 'package:zanpakuto/pages/conversations/chat_page/chat_page.dart';
import 'package:zanpakuto/pages/conversations/chats_list/chat_list.dart';
import 'package:zanpakuto/utils/responsive_layout_screen.dart';

class ConversationsPage extends StatelessWidget {
  const ConversationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Responsive(
            mobile: ChatList(),
            tablet: Row(
              children: [
                Expanded(flex: 3, child: ChatList()),
                Expanded(flex: 4, child: ChatPage()),
              ],
            ),
            desktop: Row(
              children: [
                Expanded(flex: 3, child: ChatList()),
                Expanded(flex: 4, child: ChatPage()),
                Container(width: 300, child: Container()),
              ],
            )),
      ),
    );
  }
}
