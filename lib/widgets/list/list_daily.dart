import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_daily.dart';
import 'package:pet_app/classes/mungroad_image_size.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/util/mungroad_scroll_controller.dart';
import 'package:pet_app/util/mungroad_tools.dart';
import 'package:pet_app/widgets/common/profile_box.dart';

class ListDaily extends ConsumerStatefulWidget {
  const ListDaily({Key? key}) : super(key: key);

  @override
  ListDailyState createState() => ListDailyState();
}

class ListDailyState extends ConsumerState<ListDaily> {
  late MungroadScrollController _listScrollController;

  List<MungroadDaily> _currentDailyList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _listScrollController = MungroadScrollController(
        50,
        '/daily',
        2,
        MungroadListOptions('', '', ''),
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
    List<MungroadDaily> result = await _listScrollController.getDailyList();
    setState(() {
      if (refresh == false) {
        _currentDailyList = [..._currentDailyList, ...result];
      } else {
        _currentDailyList = [...result];
        if (result.isNotEmpty && _listScrollController.hasClients) {
          _listScrollController.jumpTo(0);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_currentDailyList.isNotEmpty) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int idx) {
          return PreviewContainer(
            daily: _currentDailyList[idx],
          );
        },
        itemCount: _currentDailyList.length,
        controller: _listScrollController,
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
              '공유된 일상이 없습니다.',
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

class PreviewContainer extends StatelessWidget {
  const PreviewContainer({
    Key? key,
    required this.daily,
  }) : super(key: key);

  final MungroadDaily daily;

  @override
  Widget build(BuildContext context) {
    String currentWriteDate = MungroadTools.getWriteDate(daily.createdAt);

    return Container(
      width: double.infinity,
      height: multiplyFree(defaultSize, 20),
      padding: EdgeInsets.all(multiplyFree(defaultSize, 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: multiplyFree(defaultSize, 3.5),
            child: Row(
              children: [
                ProfileBox(
                  profilePath: daily.profilePath,
                  width: multiplyFree(defaultSize, 3.5),
                  height: multiplyFree(defaultSize, 3.5),
                  userId: daily.writerId,
                ),
                SizedBox(
                  width: multiply05(defaultSize),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      daily.nickname,
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
              ],
            ),
          ),
          Container(
            height: multiplyFree(defaultSize, 14.5),
            child: DailyContents(
              daily: daily,
            ),
          ),
        ],
      ),
    );
  }
}

class DailyContents extends StatelessWidget {
  const DailyContents({
    Key? key,
    required this.daily,
  }) : super(key: key);

  final MungroadDaily daily;

  @override
  Widget build(BuildContext context) {
    final TextStyle commentsTextStyle = TextStyle(
      fontSize: multiplyFree(defaultSize, 1),
      color: Colors.black26,
    );
    List<Widget> dailyContentsColumn = [Text(daily.contents)];
    if (daily.imageCount > 0) {
      dailyContentsColumn.add(
        SizedBox(
          // child: ListView.builder(
          //   itemBuilder: (BuildContext context, int idx) {
          //     final String fileName = MungroadTools.getImageName(
          //       daily.id,
          //       50,
          //       daily.imageList[idx].fileName,
          //       MungroadImageSize.dailySize,
          //     );
          //     return Container(
          //       width: double.infinity / 2,
          //       height: multiplyFree(defaultSize, 24),
          //       decoration: BoxDecoration(
          //         image: DecorationImage(
          //           image: NetworkImage(fileName),
          //           fit: BoxFit.cover,
          //         ),
          //       ),
          //     );
          //   },
          //   itemCount: daily.imageList.length,
          //   shrinkWrap: true,
          // ),
          height: multiplyFree(defaultSize, 10),
          child: Row(
            children: [
              ...daily.imageList.map((entry) {
                int idx = daily.imageList.indexOf(entry);
                final String fileName = MungroadTools.getImageName(
                  daily.id,
                  50,
                  daily.imageList[idx].fileName,
                  MungroadImageSize.dailySize,
                );
                return Container(
                  width: multiplyFree(defaultSize, 12),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(fileName),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        multiply09(defaultSize),
                      ),
                    ),
                  ),
                );
              })
            ].toList(),
          ),
        ),
      );
    }
    dailyContentsColumn.add(Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '댓글 ${daily.commentCount}개',
          style: commentsTextStyle,
        ),
        SizedBox(
          width: multiply05(defaultSize),
        ),
        Text(
          '좋아요 ${daily.likesCount}개',
          style: commentsTextStyle,
        ),
      ],
    ));

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: dailyContentsColumn,
    );
  }
}
