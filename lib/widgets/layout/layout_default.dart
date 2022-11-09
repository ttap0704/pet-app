import 'dart:html';

import 'package:flutter/material.dart';
import 'package:pet_app/widgets/common/app_bar.dart';
import 'package:pet_app/widgets/common/bottom_nav2.dart';

class LayoutDefault extends StatelessWidget {
  const LayoutDefault(
      {Key? key,
      required this.CustomBody,
      required this.title,
      required this.useBackButton})
      : super(key: key);
  final Widget CustomBody;
  final String title;
  final bool useBackButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: title,
        useBackButton: useBackButton,
      ),
      body: CustomBody,
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}
