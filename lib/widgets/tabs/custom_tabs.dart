import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomTabs extends ConsumerStatefulWidget {
  const CustomTabs({Key? key}) : super(key: key);

  @override
  CustomTabsState createState() => CustomTabsState();
}

class CustomTabsState extends ConsumerState<CustomTabs>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Text('asd');
  }
}
