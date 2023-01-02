import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_daily.dart';
import 'package:pet_app/classes/mungroad_image_size.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/util/mungroad_tools.dart';
import 'package:pet_app/widgets/common/profile_box.dart';
import 'package:pet_app/widgets/layout/layout.dart';
import 'package:pet_app/widgets/layout/layout_comment.dart';
import 'package:pet_app/widgets/layout/layout_contents.dart';

class DailyDetail extends ConsumerStatefulWidget {
  const DailyDetail({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  DailyDetailState createState() => DailyDetailState();
}

class DailyDetailState extends ConsumerState<DailyDetail> {
  MungroadDaily _daily =
      MungroadDaily([], 0, 0, '', 0, 0, '', '', 0, '2022-12-01 00:00:00');
  bool _updated = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setDailyDetail();
  }

  void setDailyDetail() async {
    final MungroadDaily daily = await MungroadTools.getDailyDetail(widget.id);

    setState(() {
      _daily = daily;
      _updated = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    String currentWriteDate = MungroadTools.getWriteDate(_daily.createdAt);

    return _updated
        ? LayoutComment(
            title: 'test',
            useFloatingButton: false,
            useBackButton: true,
            useNavBar: false,
            child: LayoutContents(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(multiplyFree(defaultSize, 1)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: multiplyFree(defaultSize, 3.5),
                        child: Row(
                          children: [
                            ProfileBox(
                              profilePath: _daily.profilePath,
                              size: multiplyFree(defaultSize, 3.5),
                              userId: _daily.writerId,
                            ),
                            SizedBox(
                              width: multiply05(defaultSize),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _daily.nickname,
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
                        width: double.infinity,
                        padding: EdgeInsets.only(
                          right: multiplyFree(defaultSize, 3),
                          top: multiplyFree(defaultSize, 1),
                          bottom: multiplyFree(defaultSize, 1),
                        ),
                        child: Text(
                          _daily.contents,
                          style: TextStyle(
                            fontSize: multiply12(defaultSize),
                          ),
                        ),
                      ),
                      ..._daily.imageList.map((entry) {
                        final String fileName = MungroadTools.getImageName(
                          _daily.id,
                          50,
                          entry.fileName,
                          MungroadImageSize.dailySize,
                        );

                        print(fileName);

                        return Container(
                          clipBehavior: Clip.hardEdge,
                          margin: EdgeInsets.only(
                            bottom: multiply05(defaultSize),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                multiply09(defaultSize),
                              ),
                            ),
                          ),
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.network(fileName),
                          ),
                        );
                      }).toList()
                    ],
                  ),
                ),
              ),
            ),
          )
        : SizedBox();
  }
}
