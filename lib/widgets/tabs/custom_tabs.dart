import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomTabs extends ConsumerStatefulWidget {
  const CustomTabs({Key? key}) : super(key: key);

  @override
  CustomTabsState createState() => CustomTabsState();
}

class CustomTabsState extends ConsumerState<CustomTabs> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(child: Text('CustomTabs'));
  }
}
