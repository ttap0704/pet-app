import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LayoutComment extends ConsumerStatefulWidget {
  const LayoutComment({Key? key}) : super(key: key);

  @override
  LayoutCommentState createState() => LayoutCommentState();
}

class LayoutCommentState extends ConsumerState<LayoutComment> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(child: Text('LayoutComment'));
  }
}
