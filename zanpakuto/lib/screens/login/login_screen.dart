// TODO Implement this library.import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:resizable_widget/resizable_widget.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResizableWidget(
        children: [
          // required
          Container(color: Colors.greenAccent),
          Container(color: Colors.yellowAccent),
          Container(color: Colors.redAccent),
        ],
      ),
    );
  }
}
