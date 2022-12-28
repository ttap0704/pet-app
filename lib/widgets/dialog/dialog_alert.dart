import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/styles.dart';

class DialogAlert extends ConsumerStatefulWidget {
  const DialogAlert({Key? key, required this.content, this.callback})
      : super(key: key);

  final String content;
  final Function? callback;

  @override
  DialogAlertState createState() => DialogAlertState();
}

class DialogAlertState extends ConsumerState<DialogAlert> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pop(rootContext as BuildContext);

      if (widget.callback != null) {
        widget.callback!();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      contentTextStyle: TextStyle(
        color: Colors.white,
        fontSize: multiplyFree(defaultSize, 1),
      ),
      elevation: 0,
      content: Container(
        padding: EdgeInsets.symmetric(
          vertical: multiplyFree(defaultSize, 2),
        ),
        decoration: BoxDecoration(
          color: const Color.fromARGB(100, 0, 0, 0),
          borderRadius: BorderRadius.all(
            Radius.circular(
              multiply09(defaultSize),
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.content,
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
