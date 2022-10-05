import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zanpakuto/constants/controllers.dart';
import 'package:zanpakuto/routes/routes.dart';
import 'package:zanpakuto/components/drawer_item.dart';
import 'package:zanpakuto/utils/responsive_layout_screen.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      child: ListView(
        children: [
          if (Responsive.isDesktop(context) || Responsive.isTablet(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 10, 20),
                      child: Text(
                        menuController.isCollapsed.value ? 'Z' : 'Zanpakuto',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Divider(
                  color: Colors.white54,
                ),
                Column(
                    mainAxisSize: MainAxisSize.min,
                    children: menuItems
                        .map((itemName) => SideMenuItem(
                            itemName: itemName,
                            onTap: () {
                              if (!menuController.isActive(itemName)) {
                                menuController.changeActiveItemTo(itemName);
                                if (Responsive.isMobile(context)) Get.back();
                                navigationController.navigateTo(itemName);
                              }
                            }))
                        .toList()),
              ],
            )
        ],
      ),
    );
  }
}
