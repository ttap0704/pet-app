import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_room.dart';
import 'package:pet_app/constant.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/widgets/container/container_image_slider.dart';
import 'package:pet_app/widgets/container/container_room_image.dart';

class ContainerRoom extends ConsumerStatefulWidget {
  const ContainerRoom({
    Key? key,
    required this.room,
  }) : super(key: key);

  final MungroadRoom room;
  @override
  ContainerRoomState createState() => ContainerRoomState();
}

class ContainerRoomState extends ConsumerState<ContainerRoom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.black12,
        width: 1,
      )),
      padding: EdgeInsets.all(multiplyFree(defaultSize, 2)),
      child: ContainerRoomImage(
        child: ContainerImageSlider(
          targetId: widget.room.id,
          images: widget.room.images,
          category: roomsTypeNumber,
          useFullScreen: true,
        ),
      ),
    );
  }
}
