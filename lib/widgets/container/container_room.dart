import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_room.dart';
import 'package:pet_app/constant.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/widgets/container/container_image_slider.dart';
import 'package:pet_app/widgets/container/container_room_image.dart';
import 'package:pet_app/widgets/container/container_room_info.dart';

class ContainerRoom extends ConsumerStatefulWidget {
  const ContainerRoom({
    Key? key,
    required this.room,
    required this.priceKey,
  }) : super(key: key);

  final MungroadRoom room;
  final String priceKey;
  @override
  ContainerRoomState createState() => ContainerRoomState();
}

class ContainerRoomState extends ConsumerState<ContainerRoom> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final checkRow = width >= 700 ? true : false;

    final double paddingValue = checkRow ? multiplyFree(defaultSize, 1) : 0;
    Widget child;

    if (checkRow) {
      List<Widget> contents = [
        ContainerRoomImage(
          child: ContainerImageSlider(
            targetId: widget.room.id,
            images: widget.room.images,
            category: roomsTypeNumber,
            useFullScreen: true,
          ),
        ),
        SizedBox(
          width: multiplyFree(defaultSize, 1),
        ),
        ContainerRoomInfo(room: widget.room, priceKey: widget.priceKey)
      ];
      child = Row(
        children: contents,
      );
    } else {
      List<Widget> contents = [
        ContainerRoomImage(
          child: ContainerImageSlider(
            targetId: widget.room.id,
            images: widget.room.images,
            category: roomsTypeNumber,
            useFullScreen: true,
          ),
        ),
        ContainerRoomInfo(room: widget.room, priceKey: widget.priceKey)
      ];
      child = Column(children: contents);
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
          width: 1,
        ),
      ),
      margin: EdgeInsets.only(
        bottom: multiply15(defaultSize),
      ),
      padding: EdgeInsets.all(paddingValue),
      child: child,
    );
  }
}
