import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_peak_season.dart';
import 'package:pet_app/classes/mungroad_room.dart';
import 'package:pet_app/util/mungroad_tools.dart';
import 'package:pet_app/widgets/container/container_room.dart';

class ListRooms extends ConsumerStatefulWidget {
  const ListRooms({
    Key? key,
    required this.rooms,
    required this.seasons,
  }) : super(key: key);

  final List<MungroadRoom> rooms;
  final List<MungroadPeakSeason> seasons;

  @override
  ListRoomsState createState() => ListRoomsState();
}

class ListRoomsState extends ConsumerState<ListRooms> {
  String _currentSeasonKey = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _currentSeasonKey = MungroadTools.getPriceKey(widget.seasons);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...widget.rooms.map((entry) {
          return ContainerRoom(room: entry, priceKey: _currentSeasonKey);
        })
      ],
    );
  }
}
