import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/styles.dart';

class LayoutSmall extends ConsumerStatefulWidget {
  const LayoutSmall({Key? key, required this.child}) : super(key: key);

  final Widget child;
  @override
  LayoutSmallState createState() => LayoutSmallState();
}

class LayoutSmallState extends ConsumerState<LayoutSmall> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: Container(
        width: multiplyFree(defaultSize, 22),
        height: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: multiplyFree(defaultSize, 3),
        ),
        child: widget.child,
      ),
    );
  }
}
