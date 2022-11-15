import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_app/store/common.dart';
import 'package:pet_app/store/size.dart';
import 'package:pet_app/util/colors.dart';

class CustomBottomNavigation extends ConsumerStatefulWidget {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  CustomBottomNavigationState createState() => CustomBottomNavigationState();
}

class CustomBottomNavigationState
    extends ConsumerState<CustomBottomNavigation> {
  final List<Map> _navigationItems = const [
    {'icon': Icons.start},
    {'icon': Icons.start},
    {'icon': Icons.start},
    {'icon': Icons.start},
    {'icon': Icons.start},
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final commonRead = ref.read(commonProvider.notifier);
    final commonWatch = ref.watch(commonProvider);
    final sizeWatch = ref.watch(sizeProvider);
    return BottomNavigationBar(
      onTap: (int tab) {
        commonRead.setTabNumber(tab);
        print('${sizeWatch.width}, ${sizeWatch.height}');
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
      selectedItemColor: CustomColors.orange,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    );
  }
}
