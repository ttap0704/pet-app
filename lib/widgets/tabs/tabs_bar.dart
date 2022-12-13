import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_colors.dart';
import 'package:pet_app/styles.dart';

class TabsBar extends ConsumerStatefulWidget {
  const TabsBar({
    Key? key,
    required this.items,
    required this.widgets,
  }) : super(key: key);

  final List<String> items;
  final List<Widget> widgets;

  @override
  TabsBarState createState() => TabsBarState();
}

class TabsBarState extends ConsumerState<TabsBar>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: widget.items.length,
      vsync: this,
    );
    _tabController.addListener(_handleTabSelection);
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {
        _tabIndex = _tabController.index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: Colors.black12,
              ),
            ),
          ),
          child: TabBar(
            tabs: <Widget>[
              ...widget.items.map((entry) {
                return Container(
                  height: multiplyFree(defaultSize, 3),
                  alignment: Alignment.center,
                  child: Text(
                    entry,
                    style: TextStyle(
                      fontSize: multiplyFree(defaultSize, 1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              })
            ].toList(),
            labelColor: MungroadColors.orange,
            indicatorColor: MungroadColors.orange,
            unselectedLabelColor: Colors.black26,
            controller: _tabController,
          ),
        ),
        Column(
          children: [
            SizedBox(height: multiplyFree(defaultSize, 1)),
            widget.widgets[_tabIndex],
          ],
        )
      ],
    );
  }
}
