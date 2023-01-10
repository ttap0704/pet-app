import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_colors.dart';
import 'package:pet_app/classes/mungroad_input_format.dart';
import 'package:pet_app/global.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/util/mungroad_input_controller.dart';

class CommonInput extends ConsumerStatefulWidget {
  const CommonInput({
    Key? key,
    required this.data,
    required this.expands,
    this.defaultValue,
    this.border,
    this.label,
    this.readOnly,
  }) : super(key: key);

  final MungroadInputFormat data;
  final bool expands;
  final String? defaultValue;
  final bool? border;
  final String? label;
  final bool? readOnly;

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
    if (widget.defaultValue != null) {
      widget.data.updateValue(widget.defaultValue as String);
      setState(() {
        _inputController.value = _inputController.value.copyWith(
          text: widget.defaultValue as String,
          selection: TextSelection.collapsed(
              offset: (widget.defaultValue as String).length),
        );
      });
    }
  }

  @override
  void didUpdateWidget(covariant CommonInput oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (widget.data.value.isEmpty) {
      focusNode.unfocus();
    }
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
    fontSize: multiplyFree(defaultSize, 1.2),
  );
  final TextStyle labelTextStyle =
      TextStyle(fontSize: multiplyFree(defaultSize, 1.2), color: Colors.black);

  void handleInput(String value) {
    widget.data.updateValue(value);
  }

  @override
  Widget build(BuildContext context) {
    InputBorder border =
        widget.border == false ? InputBorder.none : commonBorderStyle;
    Color backgroundColor =
        widget.readOnly == true ? MungroadColors.gray : Colors.white;

    return Focus(
      onFocusChange: (bool check) {
        if (!check) {
          focusNode.unfocus();
        }
      },
      child: TextField(
        controller: _inputController,
        style: fieldTextStyle,
        focusNode: focusNode,
        obscureText: widget.data.inputType == 'password' ? true : false,
        obscuringCharacter: '\u{2022}',
        onChanged: handleInput,
        readOnly: widget.readOnly == true ? true : false,
        decoration: InputDecoration(
          filled: true,
          fillColor: backgroundColor,
          label: Text(widget.label ?? ''),
          border: border,
          focusedBorder: border,
          enabledBorder: border,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: multiplyFree(defaultSize, 1.5),
            horizontal: multiplyFree(defaultSize, 1),
          ),
          labelStyle: labelTextStyle,
          hintStyle: fieldTextStyle,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: widget.data.hint,
        ),
        textAlignVertical: TextAlignVertical.top,
        expands: widget.expands,
        maxLines: !widget.expands ? 1 : null,
        cursorColor: Colors.black12,
      ),
    );
  }
}
