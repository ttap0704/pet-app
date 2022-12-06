import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/widgets/dialog/dialog_alert.dart';

class MungroadDailog {
  static Function(Widget widget) showCustomDialog = (Widget widget) => {
        showAnimatedDialog(
          barrierColor: const Color.fromARGB(80, 0, 0, 0),
          context: rootContext as BuildContext,
          builder: (BuildContext dialogContext) {
            return widget;
            // return
            // return ;
          },
          animationType: DialogTransitionType.slideFromBottom,
          curve: Curves.ease,
          duration: const Duration(milliseconds: 200),
        )
      };

  static Function(String content, Function? callback) openDialogAlert =
      (String content, Function? callback) => {
            showCustomDialog(
              DialogAlert(content: content, callback: callback),
            )
          };
}
