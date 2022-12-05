import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/views/accommodation/index.dart';
import 'package:pet_app/views/daily/index.dart';
import 'package:pet_app/views/index.dart';
import 'package:pet_app/views/restaurant/index.dart';
import 'package:pet_app/views/user/index.dart';
import 'package:pet_app/widgets/common/app_bar.dart';
import 'package:pet_app/widgets/common/bottom_nav.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/widgets/common/custom_floating_button.dart';

class Layout extends ConsumerStatefulWidget {
  const Layout({
    Key? key,
    required this.title,
    required this.useBackButton,
    required this.useFloatingButton,
    required this.child,
    this.floatingButtonActionWidget,
  }) : super(key: key);

  final String title;
  final bool useBackButton;
  final bool useFloatingButton;
  final Widget child;
  final Widget? floatingButtonActionWidget;

  @override
  LayoutState createState() => LayoutState();
}

class LayoutState extends ConsumerState<Layout> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    setImageSize(width);
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
      floatingActionButton: widget.useFloatingButton
          ? CustomFloatingButton(
              actionWidget: Container(),
            )
          : const SizedBox(width: 0, height: 0),
      appBar: CustomAppBar(
        title: widget.title,
        useBackButton: widget.useBackButton,
      ),
      body: widget.child,
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}
