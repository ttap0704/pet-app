import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_daily.dart';
import 'package:pet_app/util/mungroad_scroll_controller.dart';

class ListDaily extends ConsumerStatefulWidget {
  const ListDaily({Key? key}) : super(key: key);

  @override
  ListDailyState createState() => ListDailyState();
}

class ListDailyState extends ConsumerState<ListDaily> {
  late MungroadScrollController _listScrollController;
  List<MungroadDaily> _currentDailyList = [];

  @override
  Widget build(BuildContext context) {
    return const SizedBox(child: Text('ListDaily'));
  }
}
