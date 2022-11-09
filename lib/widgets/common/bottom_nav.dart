import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../store/common.dart';

class CustomBottomNavigation extends ConsumerWidget {
  const CustomBottomNavigation({super.key});

  final List<Map> _navigationItems = const [
    {'icon': Icon(Icons.start)},
    {'icon': Icon(Icons.start)}
  ];

  Color setIconColor(int idx) {
    return Colors.black;
    // if (commonState.tabNumber == idx) {
    //   return Colors.red;
    // } else {
    //   return Colors.black;
    // }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commonRead = ref.read(commonStateNotifierProvider.notifier);
    final commonState = ref.watch(commonStateNotifierProvider);

    return BottomNavigationBar(
      onTap: (int tab) {
        commonRead.setTabNumber(tab);
      },
      items: <BottomNavigationBarItem>[
        ..._navigationItems.map((entry) {
          return BottomNavigationBarItem(icon: entry['icon'], label: '');
        }).toList()
      ],
      currentIndex: 0,
      showUnselectedLabels: false,
      showSelectedLabels: false,
    );
  }
}
