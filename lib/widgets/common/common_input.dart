import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/styles.dart';

class CommonInput extends ConsumerStatefulWidget {
  const CommonInput({
    Key? key,
    this.hint,
    this.value,
  }) : super(key: key);

  final String? hint;
  final String? value;

  @override
  CommonInputState createState() => CommonInputState();
}

class CommonInputState extends ConsumerState<CommonInput> {
  final OutlineInputBorder commonBorderStyle = const OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black12,
    ),
  );
  final TextStyle fieldTextStyle =
      TextStyle(fontSize: multiplyFree(defaultSize, 1));

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: fieldTextStyle,
      decoration: InputDecoration(
        border: commonBorderStyle,
        focusedBorder: commonBorderStyle,
        enabledBorder: commonBorderStyle,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
          vertical: multiplyFree(defaultSize, 1.2),
          horizontal: multiplyFree(defaultSize, 1.2),
        ),
        labelStyle: fieldTextStyle,
        hintStyle: fieldTextStyle,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintText: 'hih',
      ),
      cursorColor: Colors.black12,
    );
  }
}
