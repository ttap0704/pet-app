import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_image_size.dart';
import 'package:pet_app/classes/mungroad_room.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/util/mungroad_tools.dart';

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
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final double maxWidth = width >= 700
        ? width - multiplyFree(defaultSize, 24)
        : width - multiplyFree(defaultSize, 2);

    return Container(
      constraints: BoxConstraints(
        maxWidth: maxWidth,
      ),
      color: Colors.red,
      width: maxWidth,
      height: multiplyFree(defaultSize, MungroadImageSize.multiplyRoomsValue),
      padding: EdgeInsets.symmetric(horizontal: multiplyFree(defaultSize, 1)),
      child: Column(
        children: [
          Column(
            children: [
              Text(
                widget.room.label,
                style: TextStyle(
                  fontSize: multiply14(defaultSize),
                  fontWeight: FontWeight.w600,
                ),
              ),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: Text(
              //     '$_price원',
              //     style: TextStyle(
              //       fontSize: multiply13(defaultSize),
              //       fontWeight: FontWeight.w600,
              //     ),
              //     textAlign: TextAlign.right,
              //   ),
              // ),
              Text(
                '$_price원',
                style: TextStyle(
                  fontSize: multiply13(defaultSize),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.right,
              )
            ],
          )
        ],
      ),
    );
  }
}
