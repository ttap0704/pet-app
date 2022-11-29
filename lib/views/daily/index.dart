import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/widgets/layout/layout_contents.dart';
import 'package:pet_app/widgets/list/list_daily.dart';

class DailyIndex extends ConsumerStatefulWidget {
  const DailyIndex({Key? key}) : super(key: key);

  @override
  DailyIndexState createState() => DailyIndexState();
}

class DailyIndexState extends ConsumerState<DailyIndex> {
  @override
  Widget build(BuildContext context) {
    return const LayoutContents(
      child: ListDaily(),
    );
  }
}
