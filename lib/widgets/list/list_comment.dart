import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_comment.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/util/mungroad_scroll_controller.dart';
import 'package:pet_app/util/mungroad_tools.dart';
import 'package:pet_app/widgets/common/profile_box.dart';

class ListComment extends ConsumerStatefulWidget {
  const ListComment({
    Key? key,
    required this.category,
    required this.targetId,
    required this.take,
    required this.options,
  }) : super(key: key);

  final int category;
  final int targetId;
  final int take;
  final MungroadListOptions options;

  @override
  ListCommentState createState() => ListCommentState();
}

class ListCommentState extends ConsumerState<ListComment> {
  late MungroadScrollController _listScrollController;
  List<MungroadComment> _commentList = [];

  @override
  void didUpdateWidget(covariant ListComment oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    _listScrollController.setOptions(widget.options);
    getList(true);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      String baseUrl =
          '/comment/category/${widget.category}/target/${widget.targetId}';
      _listScrollController = MungroadScrollController(
        widget.category,
        baseUrl,
        widget.take,
        widget.options,
      );
    });

    getList(true);
    _listScrollController.addListener(() {
      final maxScroll = _listScrollController.position.maxScrollExtent;
      final currentScroll = _listScrollController.position.pixels;
      if (maxScroll == currentScroll && _listScrollController.hasmore) {
        getList(false);
      }
    });
  }

  void getList(bool refresh) async {
    List<MungroadComment> result = await _listScrollController.getComments();
    setState(() {
      if (refresh == false) {
        _commentList = [..._commentList, ...result];
      } else {
        _commentList = [...result];
        if (result.isNotEmpty && _listScrollController.hasClients) {
          _listScrollController.jumpTo(0);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (_commentList.isNotEmpty) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int idx) {
          final MungroadComment detail = _commentList[idx];
          String currentWriteDate =
              MungroadTools.getWriteDate(detail.createdAt);
          return Column(
            children: [
              Row(
                children: [
                  ProfileBox(
                    profilePath: detail.profilePath,
                    size: multiplyFree(defaultSize, 3),
                    userId: detail.writerId,
                  ),
                  SizedBox(
                    width: multiply05(defaultSize),
                  ),
                  Text(
                    detail.nickname,
                    style: TextStyle(
                      fontSize: multiply12(defaultSize),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    currentWriteDate,
                    style: TextStyle(
                      fontSize: multiply09(defaultSize),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: multiplyFree(defaultSize, 1),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  detail.comment,
                ),
              ),
              SizedBox(
                height: multiplyFree(defaultSize, 1),
              ),
            ],
          );
        },
        itemCount: _commentList.length,
        controller: _listScrollController,
        shrinkWrap: true,
      );
    } else {
      return Container(
        constraints: BoxConstraints(
          maxHeight: multiplyFree(defaultSize, 20),
        ),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Text(
              '등록된 댓글이 없습니다.',
              style: TextStyle(
                color: Colors.black54,
                fontSize: multiplyFree(defaultSize, 1),
              ),
            ),
          ],
        ),
      );
    }
  }
}
