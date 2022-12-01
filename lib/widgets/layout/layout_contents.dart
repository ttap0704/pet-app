import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../list/list_daily.dart';

class LayoutContents extends ConsumerStatefulWidget {
  const LayoutContents({Key? key, required this.child}) : super(key: key);

  final Widget child;
  @override
  LayoutContentsState createState() => LayoutContentsState();
}

class LayoutContentsState extends ConsumerState<LayoutContents> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    double paddingValue = 0;
    if (width > 1000) {
      paddingValue = (width - 1000) / 2;
    }

    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: paddingValue,
      ),
      child: widget.child,
    );
  }
}
