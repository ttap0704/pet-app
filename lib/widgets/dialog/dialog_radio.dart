import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/styles.dart';

class DialogRadio extends ConsumerStatefulWidget {
  const DialogRadio({Key? key, required this.child}) : super(key: key);

  final Widget child;
  @override
  DialogRadioState createState() => DialogRadioState();
}

class DialogRadioState extends ConsumerState<DialogRadio> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    double paddingValue = 0;
    if (width > 1000) {
      paddingValue = (width - 1000) / 2;
    }

    return Scaffold(
      body: Container(
        color: Colors.transparent,
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.symmetric(horizontal: paddingValue),
        child: widget.child,
      ),
    );
  }
}
