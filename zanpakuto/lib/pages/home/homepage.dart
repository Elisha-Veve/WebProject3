import 'package:flutter/material.dart';
import 'package:zanpakuto/components/bottom_bar.dart';
import 'package:zanpakuto/constants/controllers.dart';
import 'package:zanpakuto/controllers/menu_controller.dart';
import 'package:zanpakuto/controllers/navigation_controller.dart';
import 'package:zanpakuto/helpers/local_navigator.dart';
import 'package:zanpakuto/routes/routes.dart';
import 'package:zanpakuto/utils/custom_themes.dart';
import 'package:get/get.dart';
import 'package:zanpakuto/components/side_bar.dart';
import 'package:zanpakuto/utils/responsive_layout_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Zanpakuto',
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        themeMode: ThemeMode.system,
        home: Responsive(
          mobile: Container(
            width: 400,
            color: Colors.black,
            child: SafeArea(
                child: Stack(
              children: [
                localNavigator(),
                Column(
                  children: [
                    Expanded(child: Container()),
                    BottomMenu(),
                  ],
                ),
              ],
            )),
          ),
          tablet: Container(
            height: 400,
            color: Colors.black,
            child: SafeArea(
                child: Row(
              children: [
                const SideBar(iconsOnly: true),
                Expanded(child: localNavigator()),
              ],
            )),
          ),
          desktop: Container(
            height: 400,
            color: Colors.white,
            child: SafeArea(
                child: Row(children: [
              const SideBar(iconsOnly: false),
              Expanded(child: localNavigator()),
            ])),
          ),
        ));
  }
}
