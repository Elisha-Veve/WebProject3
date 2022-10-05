import 'package:flutter/material.dart';
import 'package:zanpakuto/pages/dashboard/main_dashboard/main_dashboard.dart';
import 'package:zanpakuto/utils/responsive_layout_screen.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Responsive(
            mobile: Container(
              color: Colors.amber,
              child: MainDashboard(),
            ),
            desktop: Container(
              child: Row(
                children: [
                  Expanded(child: MainDashboard()),
                  Container(width: 300, child: Container()),
                ],
              ),
            )),
      ),
    );
  }
}
