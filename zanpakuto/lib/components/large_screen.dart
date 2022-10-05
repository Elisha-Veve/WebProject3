import 'package:flutter/material.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.red,
            height: double.infinity,
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            color: Colors.blue,
            height: double.infinity,
          ),
        ),
      ],
    );
  }
}
