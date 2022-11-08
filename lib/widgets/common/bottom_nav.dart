import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _tabNumber = 0;
  final List<Map> _navigationItems = const [
    {'icon': Icon(Icons.start), 'path': '/'},
    {'icon': Icon(Icons.start), 'path': '/accommodation'}
  ];

  void checkRoute() {
    String? path = ModalRoute.of(context)?.settings.name;
    if (path != null) {
      int tmpTab = 0;
      for (var i = 0, leng = _navigationItems.length; i < leng; i++) {
        if (_navigationItems[i]['path'] != '/' &&
            path.contains(_navigationItems[i]['path'])) {
          tmpTab = i;
        }
      }

      setState(() {
        _tabNumber = tmpTab;
      });
    }
  }

  @override
  void didChangeDependencies() {
    checkRoute();
    super.didChangeDependencies();
  }

  Color setIconColor(int idx) {
    if (_tabNumber == idx) {
      return Colors.red;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int tab) {
        if (tab == _tabNumber) {
          return;
        } else {
          Navigator.pushNamed(context, _navigationItems[tab]['path']);
        }
      },
      items: <BottomNavigationBarItem>[
        ..._navigationItems.map((entry) {
          return BottomNavigationBarItem(icon: entry['icon'], label: '');
        }).toList()
      ],
      currentIndex: _tabNumber,
      showUnselectedLabels: false,
      showSelectedLabels: false,
    );
  }
}
