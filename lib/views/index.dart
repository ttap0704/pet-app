import 'package:flutter/material.dart';
import 'package:pet_app/widgets/layout/layout_default.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutDefault(
      useBackButton: false,
      title: 'test',
      CustomBody: Text('hhi'),
    );
  }
}
