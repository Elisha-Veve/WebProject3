import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool iconsOnly;
  final VoidCallback onTap;

  const DrawerListTile({
    Key? key,
    required this.title,
    required this.icon,
    this.iconsOnly = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: Colors.blue,
      //   borderRadius: BorderRadius.circular(10),
      // ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      child: iconsOnly
          ? Icon(icon)
          : Row(
              children: [
                Icon(icon),
                const SizedBox(width: 10),
                Text(title),
              ],
            ),
    );
  }
}
