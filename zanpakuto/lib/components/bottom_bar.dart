import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zanpakuto/constants/controllers.dart';
import 'package:zanpakuto/routes/routes.dart';
import 'package:zanpakuto/utils/responsive_layout_screen.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({Key? key}) : super(key: key);

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0x00025E73),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          child: BottomNavigationBar(
            selectedFontSize: 0,
            unselectedFontSize: 0,
            type: BottomNavigationBarType.fixed,
            items: menuItems
                .map((itemName) => BottomNavigationBarItem(
                    icon: menuController.returnIconFor(itemName), label: ''))
                .toList(),
            currentIndex: menuController.index.value,
            onTap: (int index) {
              if (!menuController.isActive(menuItems[index])) {
                setState(() {
                  menuController.changeActiveItemTo(menuItems[index]);
                });
                if (Responsive.isMobile(context)) Get.back();

                navigationController.navigateTo(menuItems[index]);
              }
            },
          ),
        ),
      ),
    );
  }
}
