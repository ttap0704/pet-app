import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_image_size.dart';
import 'package:pet_app/classes/mungroad_room.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/util/mungroad_tools.dart';

class RoomDetailInfo {
  String title;
  String label;

  RoomDetailInfo(this.title, this.label);
}

class ContainerRoomInfo extends ConsumerStatefulWidget {
  const ContainerRoomInfo({
    Key? key,
    required this.room,
    required this.priceKey,
  }) : super(key: key);

  final MungroadRoom room;
  final String priceKey;

  @override
  ContainerRoomInfoState createState() => ContainerRoomInfoState();
}

class ContainerRoomInfoState extends ConsumerState<ContainerRoomInfo> {
  String _price = '';
  List<RoomDetailInfo> _times = [];
  List<RoomDetailInfo> _people = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    int currentPrice = 0;
    if (widget.priceKey == 'peak_weekend_price') {
      currentPrice = widget.room.peakWeekendPrice;
    } else if (widget.priceKey == 'peak_price') {
      currentPrice = widget.room.peakPrice;
    } else if (widget.priceKey == 'normal_weekend_price') {
      currentPrice = widget.room.normalWeekendPrice;
    } else {
      currentPrice = widget.room.normalPrice;
    }

    setState(() {
      _price = MungroadTools.setPriceFormat(currentPrice);
      _times = [
        RoomDetailInfo('입실시간', widget.room.entrance),
        RoomDetailInfo('퇴실시간', '익일 ${widget.room.entrance}'),
      ];
      _people = [
        RoomDetailInfo('기준인원', '${widget.room.standardNum}명'),
        RoomDetailInfo('최대인원', '${widget.room.maximumNum}명'),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final checkRow = width >= 700 ? true : false;

    final TextStyle titleStyle = TextStyle(
      fontSize: multiply11(defaultSize),
      fontWeight: FontWeight.w600,
      color: Colors.black54,
    );
    final TextStyle labelStyle = TextStyle(
      fontSize: multiply11(defaultSize),
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );

    final Widget contents = Container(
      height: checkRow
          ? multiplyFree(defaultSize, MungroadImageSize.multiplyRoomsValue)
          : multiplyFree(defaultSize, 12),
      padding: EdgeInsets.symmetric(horizontal: multiplyFree(defaultSize, 1)),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.black12,
                  ),
                ),
              ),
              padding: EdgeInsets.only(
                top: checkRow ? 0 : multiply05(defaultSize),
                bottom: multiply05(defaultSize),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.room.label,
                      style: TextStyle(
                        fontSize: multiply14(defaultSize),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '$_price원',
                      style: TextStyle(
                        fontSize: multiply13(defaultSize),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                top: multiply15(defaultSize),
                bottom: multiplyFree(defaultSize, 1),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ..._times.map((entry) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(entry.title, style: titleStyle),
                              Text(entry.label, style: labelStyle),
                            ],
                          );
                        })
                      ],
                    ),
                  ),
                  Container(
                    width: 1,
                    color: Colors.black12,
                    margin: EdgeInsets.symmetric(
                      horizontal: multiply05(defaultSize),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ..._people.map((entry) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(entry.title, style: titleStyle),
                              Text(entry.label, style: labelStyle),
                            ],
                          );
                        })
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );

    if (checkRow) {
      return Expanded(child: contents);
    } else {
      return contents;
    }
  }
}
