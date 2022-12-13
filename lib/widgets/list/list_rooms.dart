import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_room.dart';
import 'package:pet_app/widgets/container/container_room.dart';

class ListRooms extends ConsumerStatefulWidget {
  const ListRooms({Key? key, required this.rooms}) : super(key: key);

  final List<MungroadRoom> rooms;

  @override
  ListRoomsState createState() => ListRoomsState();
}

class ListRoomsState extends ConsumerState<ListRooms> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...widget.rooms.map((entry) {
          return ContainerRoom(room: entry);
        })
      ],
    );
  }
}
