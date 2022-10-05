import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zanpakuto/constants/controllers.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;
  final bool iconsOnly;

  const SideMenuItem({
    Key? key,
    required this.itemName,
    required this.onTap,
    this.iconsOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value
            ? menuController.onHover(itemName)
            : menuController.onHover("not hovering");
      },
      child: Obx(
        () => Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: menuController.activeItem.value == itemName
                ? Colors.blue
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: menuController.isCollapsed.value
              ? Row(children: [menuController.returnIconFor(itemName)])
              : Row(
                  children: [
                    (menuController.returnIconFor(itemName)),
                    const SizedBox(width: 10),
                    Text(
                      itemName,
                      style: TextStyle(
                        color: menuController.activeItem.value == itemName
                            ? Colors.white
                            : Colors.white,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}


// onTap: onTap,
//       onHover: (value) {
//         value
//             ? menuController.onHover(itemName)
//             : menuController.onHover("not hovering");
//       },
//       child: Obx(() => Container(
//             color: menuController.isHovering(itemName)
//                 ? Colors.blue
//                 : Colors.transparent,
//             child: Row(
//               children: [
//                 Visibility(
//                   visible: menuController.isHovering(itemName) ||
//                       menuController.isActive(itemName),
//                   child: Container(
//                     width: 6,
//                     height: 40,
//                     color: Colors.blue,
//                   ),
//                   maintainSize: true,
//                   maintainAnimation: true,
//                   maintainState: true,
//                 ),
//                 SizedBox(width: _width > 1200 ? 20 : 0),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: menuController.returnIconFor(itemName),
//                 ),
//                 if (!menuController.isActive(itemName))
//                   Flexible(
//                     child: Text(
//                       itemName,
//                       style: TextStyle(
//                           color: menuController.isHovering(itemName)
//                               ? Colors.blue
//                               : Colors.white),
//                     ),
//                   ) else
//                   Flexible(
//                     child: Text(
//                       itemName,
//                       style: TextStyle(
//                           color: menuController.isHovering(itemName)
//                               ? Colors.blue
//                               : Colors.white),
//                     ),
//                   ),
//               ],
//             ),
//           )),
//     );