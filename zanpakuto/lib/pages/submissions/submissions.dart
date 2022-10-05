import 'package:flutter/material.dart';
import 'package:zanpakuto/pages/submissions/submissions_main/submissions_main.dart';
import 'package:zanpakuto/utils/responsive_layout_screen.dart';

class SubmissionsPage extends StatelessWidget {
  const SubmissionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Responsive(
          mobile: MainSubmissions(),
          tablet: Row(
            children: [
              Expanded(child: MainSubmissions()),
              Container(
                width: 300,
                color: Colors.blueGrey,
              ),
            ],
          ),
          desktop: Row(
            children: [
              Expanded(child: MainSubmissions()),
              Container(
                width: 300,
                color: Colors.lightGreenAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
