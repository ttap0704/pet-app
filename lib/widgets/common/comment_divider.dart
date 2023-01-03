import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/styles.dart';

class CommentDivider extends StatelessWidget {
  const CommentDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: multiplyFree(defaultSize, 0.5),
      margin: EdgeInsets.symmetric(vertical: multiplyFree(defaultSize, 1)),
      color: Colors.black12,
    );
  }
}
