import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_entire_menu_category.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/util/mungroad_tools.dart';
import 'dart:math' as math;

class ListEntireMenu extends ConsumerStatefulWidget {
  const ListEntireMenu({
    Key? key,
    required this.category,
  }) : super(key: key);

  final List<MungroadEntireMenuCategory> category;

  @override
  ListEntireMenuState createState() => ListEntireMenuState();
}

class ListEntireMenuState extends ConsumerState<ListEntireMenu> {
  List<int> _open = [0];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void handleOpen(int idx) {
    List<int> tmpOpen = [..._open];
    int findIndex = tmpOpen.indexOf(idx);
    if (findIndex >= 0) {
      tmpOpen.removeAt(findIndex);
    } else {
      tmpOpen.add(idx);
    }

    setState(() {
      _open = [...tmpOpen];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...widget.category.map((entry) {
        final int idx = widget.category.indexOf(entry);
        final bool isOpen = _open.contains(idx);
        final int degree = isOpen ? 270 : 90;

        final TextStyle menuStyle = TextStyle(
          fontSize: multiplyFree(defaultSize, 1),
        );

        List<Widget> categoryWidget = [
          GestureDetector(
            onTap: () {
              handleOpen(idx);
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: multiplyFree(defaultSize, 0.75),
                horizontal: multiplyFree(defaultSize, 1),
              ),
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    entry.category,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: multiplyFree(defaultSize, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Transform.rotate(
                    angle: degree * math.pi / 180,
                    child: Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                      size: multiply12(defaultSize),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ];

        if (isOpen) {
          categoryWidget.add(
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...widget.category[idx].menu.map((menuEntry) {
                  int menuIndex = widget.category[idx].menu.indexOf(menuEntry);

                  Border menuBorder = const Border();
                  if (menuIndex != 0) {
                    menuBorder = const Border(
                      top: BorderSide(
                        width: 1,
                        color: Colors.black12,
                      ),
                    );
                  }

                  // decoration: BoxDecoration(
                  //   border: Border(
                  //     color: Colors.black12,
                  //     style: BorderStyle.solid,
                  //     width: 1.0,
                  //   ),
                  // )

                  return Container(
                    decoration: BoxDecoration(
                      border: menuBorder,
                    ),
                    padding: EdgeInsets.only(
                      top: multiplyFree(defaultSize, 0.75),
                      bottom: multiplyFree(defaultSize, 0.75),
                      left: multiplyFree(defaultSize, 2),
                      right: multiplyFree(defaultSize, 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          menuEntry.label,
                          style: menuStyle,
                        ),
                        Text(
                          '${MungroadTools.setPriceFormat(menuEntry.price)}원',
                          style: menuStyle,
                        ),
                      ],
                    ),
                  );
                }).toList()
              ],
            ),
          );
        }

        return Column(
          children: categoryWidget,
        );
      }),
    ]);
  }
}
