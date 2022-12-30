import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DailyDetail extends ConsumerStatefulWidget {
  const DailyDetail({Key? key}) : super(key: key);

  @override
  DailyDetailState createState() => DailyDetailState();
}

class DailyDetailState extends ConsumerState<DailyDetail> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(child: Text('DailyDetail'));
  }
}
