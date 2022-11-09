import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_app/store/common.dart';

class CustomBottomNavigation extends ConsumerStatefulWidget {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  CustomBottomNavigationState createState() => CustomBottomNavigationState();
}

class CustomBottomNavigationState
    extends ConsumerState<CustomBottomNavigation> {
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
  void initState() {
    super.initState();

    // ref.listen(commonStateNotifierProvider, (previous, next) {
    //   print('$previous, $next');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int tab) {
        ref.read(commonStateNotifierProvider.notifier).setTabNumber(tab);
        // print(commonWatch.tabNumber);
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
