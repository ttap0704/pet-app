import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/styles.dart';

class LayoutLogin extends ConsumerStatefulWidget {
  const LayoutLogin({Key? key, required this.child}) : super(key: key);

  final Widget child;
  @override
  LayoutLoginState createState() => LayoutLoginState();
}

class LayoutLoginState extends ConsumerState<LayoutLogin> {
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
