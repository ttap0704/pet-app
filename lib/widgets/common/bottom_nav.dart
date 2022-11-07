import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int tabNumber = 0;
  final List<String> _navigationItems = const ['/', '/accommodation'];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int tab) {
        setState(() {
          tabNumber = tab;
        });
        Navigator.pushNamed(context, _navigationItems[tab]);
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.start), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.call_end), label: ''),
      ],
      showUnselectedLabels: false,
      showSelectedLabels: false,
    );
  }
}
