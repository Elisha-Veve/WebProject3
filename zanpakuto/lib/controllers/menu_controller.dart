import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zanpakuto/routes/routes.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItem = DashboardPageRoute.obs;
  var hoverItem = ''.obs;
  var isCollapsed = true.obs;
  var displayBottomBar = true.obs;
  var index = 0.obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
    index.value = menuItems.indexOf(itemName);
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  changeCollapseState(bool value) {
    isCollapsed.value = value;
  }

  hideBottomBar() {
    displayBottomBar.value = false;
  }

  showBottomBar() {
    displayBottomBar.value = true;
  }

  isActive(String itemName) => activeItem.value == itemName;
  isHovering(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case DashboardPageRoute:
        return _customIcon(CupertinoIcons.home, itemName);
      case CalenderPageRoute:
        return _customIcon(CupertinoIcons.calendar, itemName);
      case ConversationsPageRoute:
        return _customIcon(CupertinoIcons.chat_bubble, itemName);
      case SubmissionsPageRoute:
        return _customIcon(CupertinoIcons.doc, itemName);
      case SettingsPageRoute:
        return _customIcon(CupertinoIcons.settings, itemName);
      default:
        return _customIcon(CupertinoIcons.circle, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) {
      return Icon(
        icon,
        color: Colors.white,
      );
    } else {
      return Icon(
        icon,
        color: isHovering(itemName) ? Colors.white : Colors.white54,
      );
    }
  }
}
