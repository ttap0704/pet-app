import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FullScreenSlider extends ConsumerStatefulWidget {
  const FullScreenSlider({
    Key? key,
    required this.visible,
    required this.onClose,
  }) : super(key: key);

  final bool visible;
  final void onClose;

  @override
  FullScreenSliderState createState() => FullScreenSliderState();
}

class FullScreenSliderState extends ConsumerState<FullScreenSlider> {
  @override
  Widget build(BuildContext context) {
    if (widget.visible) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Container(
          width: double.infinity,
          color: Colors.red,
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
