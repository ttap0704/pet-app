import 'package:flutter/material.dart';
import 'package:pet_app/widgets/layout/layout_default.dart';

class AccommodationIndex extends StatelessWidget {
  const AccommodationIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LayoutDefault(
      useBackButton: true,
      title: 'test',
      CustomBody: Text('AccommodationIndex'),
    );
  }
}
