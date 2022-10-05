import 'package:flutter/material.dart';
import 'package:zanpakuto/components/search_field.dart';
import 'package:zanpakuto/screens/dashboard/components/header.dart';
import 'package:zanpakuto/utils/constants.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(children: [
              Header(),
              SizedBox(height: defaultPadding),
              Row(
                children: [
                  Expanded(
                      flex: 5,
                      child: Container(height: 400, color: Colors.white)),
                  SizedBox(
                    width: defaultPadding,
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 400,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(children: [
                          Text("Name"),
                          SizedBox(
                            height: 200,
                            child: CircleAvatar(
                                radius: 100, backgroundColor: Colors.blue),
                          )
                        ]),
                      )),
                ],
              )
            ])));
  }
}
