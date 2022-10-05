import 'package:flutter/material.dart';
import 'package:zanpakuto/components/side_menu.dart';

class SideBar extends StatelessWidget {
  final bool iconsOnly;

  const SideBar({Key? key, required this.iconsOnly}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(width: iconsOnly ? 60 : 200, child: const SideMenu());
  }
}
