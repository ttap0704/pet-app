import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_input_format.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/util/mungroad_input_controller.dart';

class CommonInput extends ConsumerStatefulWidget {
  const CommonInput({
    Key? key,
    required this.data,
    required this.expands,
  }) : super(key: key);

  final MungroadInputFormat data;
  final bool expands;

  @override
  CommonInputState createState() => CommonInputState();
}

class CommonInputState extends ConsumerState<CommonInput> {
  final TextEditingController _inputController = MungroadInputController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _inputController.text = widget.data.value;
    });
  }

  final OutlineInputBorder commonBorderStyle = const OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black12,
    ),
  );
  final TextStyle fieldTextStyle = TextStyle(
    fontSize: multiplyFree(defaultSize, 1),
  );

  void handleInput(String value) {
    widget.data.updateValue(value);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _inputController,
      style: fieldTextStyle,
      focusNode: focusNode,
      obscureText: widget.data.inputType == 'password' ? true : false,
      obscuringCharacter: '\u{2022}',
      onChanged: handleInput,
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
        hintText: widget.data.hint,
      ),
      textAlignVertical: TextAlignVertical.top,
      expands: widget.expands,
      maxLines: !widget.expands ? 1 : null,
      cursorColor: Colors.black12,
    );
  }
}
