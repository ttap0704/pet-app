import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/styles.dart';

class DialogConfirm extends ConsumerStatefulWidget {
  const DialogConfirm({
    Key? key,
    required this.content,
    required this.callback,
    required this.buttons,
  }) : super(key: key);

  final String content;
  final Function callback;
  final List<String> buttons;

  @override
  DialogConfirmState createState() => DialogConfirmState();
}

class DialogConfirmState extends ConsumerState<DialogConfirm> {
  void handleButtons(String text) {
    final confirmText = ['확인'];
    Navigator.pop(rootContext as BuildContext);
    if (confirmText.contains(text)) {
      widget.callback();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      contentTextStyle: TextStyle(
        color: Colors.black,
        fontSize: multiplyFree(defaultSize, 1),
      ),
      elevation: 0,
      content: Container(
        decoration: BoxDecoration(
          color: Colors.white,
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
            Container(
              padding: EdgeInsets.symmetric(
                vertical: multiplyFree(defaultSize, 2),
              ),
              child: Text(
                widget.content,
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: multiplyFree(defaultSize, 1),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...widget.buttons.map((entry) {
                  final int idx = widget.buttons.indexOf(entry);
                  final Color textColor =
                      ['확인'].contains(entry) ? Colors.blue : Colors.black54;
                  return Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        handleButtons(entry);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: multiplyFree(defaultSize, 3.25),
                        decoration: BoxDecoration(
                          border: Border(
                            top: const BorderSide(
                              width: 1,
                              color: Colors.black12,
                            ),
                            right: BorderSide(
                              width: idx == 0 ? 1 : 0,
                              color: Colors.black12,
                            ),
                          ),
                        ),
                        child: Text(
                          entry,
                          style: TextStyle(
                            fontSize: multiplyFree(defaultSize, 1),
                            color: textColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
