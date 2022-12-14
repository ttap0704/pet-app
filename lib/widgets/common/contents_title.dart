import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/styles.dart';

class ContentsTitle extends StatelessWidget {
  const ContentsTitle({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: multiplyFree(defaultSize, 1),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: multiply11(defaultSize),
        ),
      ),
    );
  }
}
