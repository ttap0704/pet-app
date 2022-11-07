import 'package:flutter/material.dart';
import 'package:pet_app/widgets/common/bottom_nav.dart';

class LayoutApp extends StatelessWidget {
  const LayoutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('hihi'),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}
