import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_input_format.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/widgets/common/common_input.dart';
import 'package:pet_app/widgets/layout/layout.dart';

class LayoutComment extends ConsumerStatefulWidget {
  const LayoutComment({
    Key? key,
    required this.title,
    required this.useBackButton,
    required this.useFloatingButton,
    required this.child,
    required this.useNavBar,
  }) : super(key: key);

  final String title;
  final bool useBackButton;
  final bool useFloatingButton;
  final Widget child;
  final bool useNavBar;

  @override
  LayoutCommentState createState() => LayoutCommentState();
}

class LayoutCommentState extends ConsumerState<LayoutComment> {
  final MungroadInputFormat _contents = MungroadInputFormat(
    'comment',
    '',
    'text',
    'comment',
    '댓글을 남겨주세요!',
    0,
  );

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: widget.title,
      useFloatingButton: widget.useFloatingButton,
      useBackButton: widget.useBackButton,
      useNavBar: widget.useNavBar,
      child: Column(
        children: [
          Flexible(child: widget.child),
          Container(
            width: double.infinity,
            height: multiplyFree(defaultSize, 4),
            child: Row(
              children: [
                Flexible(
                  child: CommonInput(
                    data: _contents,
                    expands: false,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('등록'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
