import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/widgets/dialog/dialog_alert.dart';

class MungroadDailog {
  static Function(String title, String content) openDialogAlert =
      (String title, String content) => {
            showDialog(
              context: rootContext as BuildContext,
              builder: (BuildContext dialogContext) {
                return DialogAlert(
                  title: title,
                  content: content,
                );
              },
            )
          };
}
