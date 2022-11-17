import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/store/common.dart';
import 'package:pet_app/views/accommodation/index.dart';
import 'package:pet_app/views/daily/index.dart';
import 'package:pet_app/views/index.dart';
import 'package:pet_app/views/restaurant/index.dart';
import 'package:pet_app/views/user/user.dart';
import 'package:pet_app/widgets/common/app_bar.dart';
import 'package:pet_app/widgets/common/bottom_nav.dart';
import 'package:pet_app/styles.dart';

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
    },
    {
      'widget': const AccommodationIndex(),
      'title': 'home2',
      'useBackButton': true,
    },
    {
      'widget': const RestaurantIndex(),
      'title': 'home3',
      'useBackButton': true,
    },
    {
      'widget': const DailyIndex(),
      'title': 'home4',
      'useBackButton': true,
    },
    {
      'widget': const UserIndex(),
      'title': 'home5',
      'useBackButton': true,
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final commonWatch = ref.watch(commonProvider);

    final width = MediaQuery.of(context).size.width;

    if (width <= 600) {
      defaultSize = 12;
    } else if (width > 600 && width <= 768) {
      defaultSize = 13;
    } else if (width > 768 && width <= 992) {
      defaultSize = 14;
    } else if (width > 992 && width <= 1200) {
      defaultSize = 15;
    } else {
      defaultSize = 16;
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: _defaultList[commonWatch.tabNumber]['title'],
        useBackButton: _defaultList[commonWatch.tabNumber]['useBackButton'],
      ),
      body: Container(
        child: _defaultList[commonWatch.tabNumber]['widget'],
      ),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}
