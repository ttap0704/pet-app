import 'dart:html';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/widgets/tabs/custom_tabs.dart';

class LayoutTabs extends ConsumerStatefulWidget {
  const LayoutTabs({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  DemoState createState() => DemoState();
}

class DemoState extends ConsumerState<LayoutTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: multiply14(defaultSize),
        horizontal: multiply12(defaultSize),
      ),
      child: Column(
        children: <Widget>[
          CustomTabs(),
          widget.child,
        ],
      ),
    );
  }
}
