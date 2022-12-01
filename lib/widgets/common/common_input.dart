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
  String _hint = '';
  String _value = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String tmpHint = '';
    String tmpValue = '';
    if (widget.hint != null) {
      tmpHint = widget.hint.toString();
    } else {
      tmpHint = '';
    }

    if (widget.value != null) {
      tmpValue = widget.value.toString();
    } else {
      tmpValue = '';
    }

    setState(() {
      _hint = tmpHint;
      _value = tmpValue;
    });
  }

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
          vertical: multiplyFree(defaultSize, 1.5),
          horizontal: multiplyFree(defaultSize, 1),
        ),
        labelStyle: fieldTextStyle,
        hintStyle: fieldTextStyle,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: _hint,
      ),
      cursorColor: Colors.black12,
    );
  }
}
