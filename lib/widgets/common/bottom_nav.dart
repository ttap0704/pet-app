import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/store/common.dart';
import 'package:pet_app/classes/mungroad_colors.dart';
import 'package:pet_app/styles.dart';

class CustomBottomNavigation extends ConsumerStatefulWidget {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  CustomBottomNavigationState createState() => CustomBottomNavigationState();
}

class CustomBottomNavigationState
    extends ConsumerState<CustomBottomNavigation> {
  final List<Map> _navigationItems = const [
    {'icon': Icons.house},
    {'icon': Icons.bed},
    {'icon': Icons.restaurant},
    {'icon': Icons.message},
    {'icon': Icons.menu},
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final commonRead = ref.read(commonProvider.notifier);
    final commonWatch = ref.watch(commonProvider);
    final double width = MediaQuery.of(context).size.width;

    double paddingValue = 0;
    if (width > 1000) {
      paddingValue = (width - 1000) / 2;
    }

    return Container(
      height: kBottomNavigationBarHeight,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(
        horizontal: paddingValue,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.black12,
            width: 1,
          ),
        ),
      ),
      child: BottomNavigationBar(
        onTap: (int tab) {
          commonRead.setTabNumber(tab);
        },
        items: <BottomNavigationBarItem>[
          ..._navigationItems.map((entry) {
            return BottomNavigationBarItem(
              icon: Icon(entry['icon']),
              label: '',
            );
          }).toList()
        ],
        currentIndex: commonWatch.tabNumber,
        unselectedItemColor: Colors.black26,
        selectedItemColor: MungroadColors.orange,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}
