import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Demo extends ConsumerStatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  DemoState createState() => DemoState();
}

class DemoState extends ConsumerState<Demo> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(child: Text('Demo'));
  }
}
