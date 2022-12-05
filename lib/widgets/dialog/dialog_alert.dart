import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/styles.dart';

class DialogAlert extends ConsumerStatefulWidget {
  const DialogAlert({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  DialogAlertState createState() => DialogAlertState();
}

class DialogAlertState extends ConsumerState<DialogAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      backgroundColor: const Color.fromARGB(25, 0, 0, 0),
      contentTextStyle: TextStyle(
        color: Colors.white,
        fontSize: multiplyFree(defaultSize, 1),
      ),
      contentPadding: EdgeInsets.all(multiplyFree(defaultSize, 1)),
      content: Container(
        constraints: BoxConstraints(
          maxWidth: double.infinity,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.content,
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
