import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_daily.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/util/mungroad_scroll_controller.dart';
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
    DateTime writeDate = DateTime.parse(daily.createdAt);
    String currentWriteDate = writeDate.toString().substring(0, 10);

    return Container(
      width: double.infinity,
      height: multiplyFree(defaultSize, 20),
      padding: EdgeInsets.all(multiplyFree(defaultSize, 1)),
      child: Row(
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
                Column(
                  children: [
                    Text(daily.nickname),
                    Text(currentWriteDate),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
