import 'package:flutter/material.dart';

class Styles {
  double width;
  double height;

  late TextStyle textTextStyle = TextStyle(
    color: Colors.black,
    fontSize: width / 20,
    fontWeight: FontWeight.w700,
  );

  Styles(this.width, this.height);
}
