import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_colors.dart';
import 'package:pet_app/classes/mungroad_input_format.dart';
import 'package:pet_app/store/user.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/util/mungroad_dialog.dart';
import 'package:pet_app/util/mungroad_scroll_controller.dart';
import 'package:pet_app/widgets/common/common_input.dart';
import 'package:pet_app/widgets/layout/layout.dart';
import 'package:pet_app/http.dart';
import 'package:pet_app/widgets/list/list_comment.dart';

import 'layout_contents.dart';

class LayoutComment extends ConsumerStatefulWidget {
  const LayoutComment({
    Key? key,
    required this.title,
    required this.useBackButton,
    required this.useFloatingButton,
    required this.child,
    required this.useNavBar,
    required this.targetId,
    required this.category,
  }) : super(key: key);

  final String title;
  final bool useBackButton;
  final bool useFloatingButton;
  final Widget child;
  final bool useNavBar;
  final int targetId;
  final int category;

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

  void createComment() async {
    final userWatch = ref.watch(userProvider);
    if (userWatch.id > 0) {
      if (_contents.value.isEmpty) {
        MungroadDailog.openDialogAlert('한 자 이상의 댓글을 작성해주세요.', null);
      } else {
        Map createData = {
          'comment': _contents.value,
          'writer_id': userWatch.id,
          'target_id': widget.targetId,
          'category': widget.category,
        };
        final createResult = await HttpApi.postApi('/comment', createData);
        MungroadDailog.openDialogAlert('댓글이 성공적으로 등록되었습니다!', null);
      }
    } else {
      MungroadDailog.openDialogAlert('로그인 후 댓글을 작성해주세요.', null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: widget.title,
      useFloatingButton: widget.useFloatingButton,
      useBackButton: widget.useBackButton,
      useNavBar: widget.useNavBar,
      child: Column(
        children: [
          Flexible(
            child: LayoutContents(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(multiplyFree(defaultSize, 1)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      widget.child,
                      ListComment(
                        category: widget.category,
                        targetId: widget.targetId,
                        take: 10,
                        options: MungroadListOptions(null, null, null),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: multiplyFree(defaultSize, 4),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: Colors.black12,
                ),
              ),
            ),
            child: Container(
              color: Colors.white,
              child: Row(
                children: [
                  Flexible(
                    child: CommonInput(
                      data: _contents,
                      expands: false,
                      border: false,
                    ),
                  ),
                  TextButton(
                    onPressed: createComment,
                    child: const Text(
                      '등록',
                      style: TextStyle(
                        color: MungroadColors.orange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
