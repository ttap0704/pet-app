import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:pet_app/classes/mungroad_image.dart';
import 'package:pet_app/global.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/widgets/dialog/dialog_alert.dart';
import 'package:pet_app/widgets/dialog/dialog_confirm.dart';
import 'package:pet_app/widgets/dialog/dialog_radio.dart';
import 'package:pet_app/widgets/dialog/dialog_slider.dart';

class MungroadDialogOptions {
  bool useBarrier;

  MungroadDialogOptions(
    this.useBarrier,
  );
}

class MungroadDialog {
  static Function(Widget widget) showCustomDialog = (Widget widget) {
    showAnimatedDialog(
      barrierColor: const Color.fromARGB(80, 0, 0, 0),
      context: rootContext as BuildContext,
      builder: (BuildContext dialogContext) {
        return widget;
      },
      animationType: DialogTransitionType.slideFromBottom,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 200),
    );
  };

  static Function(String content, Function? callback) openDialogAlert =
      (String content, Function? callback) {
    showCustomDialog(
      DialogAlert(content: content, callback: callback),
    );
  };

  static Function(Widget child) openDialogSlider = (Widget child) {
    showCustomDialog(
      DialogSlider(child: child),
    );
  };

  static Function(String contents, Function callback, List<String> buttons)
      openDialogConfirm =
      (String contents, Function callback, List<String> buttons) {
    showCustomDialog(
      DialogConfirm(content: contents, callback: callback, buttons: buttons),
    );
  };

  static Function(Widget child, List<String> values) openDialogRadio =
      (Widget child, List<String> values) {
    showCustomDialog(DialogRadio(
      child: child,
      values: values,
    ));
  };
}
