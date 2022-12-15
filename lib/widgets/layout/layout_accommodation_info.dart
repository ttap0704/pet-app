import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_accommodation.dart';

class LayoutAccommodationInfo extends ConsumerStatefulWidget {
  const LayoutAccommodationInfo({
    Key? key,
    required this.product,
  }) : super(key: key);

  final MungroadAccommodation product;
  @override
  LayoutAccommodationInfoState createState() => LayoutAccommodationInfoState();
}

class LayoutAccommodationInfoState
    extends ConsumerState<LayoutAccommodationInfo> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(child: Text('LayoutAccommodationInfo'));
  }
}
