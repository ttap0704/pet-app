import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/store/common.dart';
import 'package:pet_app/views/accommodation/index.dart';
import 'package:pet_app/views/daily/index.dart';
import 'package:pet_app/views/index.dart';
import 'package:pet_app/views/restaurant/index.dart';
import 'package:pet_app/views/user/index.dart';
import 'package:pet_app/widgets/layout/layout.dart';

class LayoutDefault extends ConsumerStatefulWidget {
  const LayoutDefault({
    Key? key,
  }) : super(key: key);

  @override
  LayoutDefaultState createState() => LayoutDefaultState();
}

class LayoutDefaultState extends ConsumerState<LayoutDefault> {
  final List<Map> _defaultList = [
    {
      'widget': const Home(),
      'title': 'home1',
      'useBackButton': false,
      'useFloatingButton': false,
    },
    {
      'widget': const AccommodationIndex(),
      'title': '숙박업소',
      'useBackButton': false,
      'useFloatingButton': false,
    },
    {
      'widget': const RestaurantIndex(),
      'title': '음식점',
      'useBackButton': false,
      'useFloatingButton': false,
    },
    {
      'widget': const DailyIndex(),
      'title': 'home4',
      'useBackButton': false,
      'useFloatingButton': true,
    },
    {
      'widget': const UserIndex(),
      'title': 'home5',
      'useBackButton': false,
      'useFloatingButton': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final commonWatch = ref.watch(commonProvider);

    return Layout(
      title: _defaultList[commonWatch.tabNumber]['title'],
      useBackButton: _defaultList[commonWatch.tabNumber]['useBackButton'],
      child: _defaultList[commonWatch.tabNumber]['widget'],
      useFloatingButton: _defaultList[commonWatch.tabNumber]
          ['useFloatingButton'],
      useNavBar: true,
    );
  }
}
