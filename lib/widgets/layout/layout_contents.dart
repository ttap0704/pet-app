import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/store/common.dart';

import '../list/list_daily.dart';

class LayoutContents extends ConsumerStatefulWidget {
  const LayoutContents({Key? key}) : super(key: key);

  @override
  LayoutContentsState createState() => LayoutContentsState();
}

class LayoutContentsState extends ConsumerState<LayoutContents> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: const ListDaily(),
    );
  }
}
