import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_colors.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/widgets/common/custom_radio_button.dart';

class DialogRadio extends ConsumerStatefulWidget {
  const DialogRadio({
    Key? key,
    required this.values,
    required this.onSubmit,
    required this.defaultValue,
  }) : super(key: key);

  final List<String> values;
  final Function(String value) onSubmit;
  final String defaultValue;
  @override
  DialogRadioState createState() => DialogRadioState();
}

class DialogRadioState extends ConsumerState<DialogRadio> {
  String _selectedValue = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _selectedValue = widget.defaultValue;
    });
  }

  void handleValue(String value) {
    setState(() {
      _selectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    double paddingValue = 0;
    if (width > 500) {
      paddingValue = (width - 500) / 2;
    }

    return Container(
      color: Colors.transparent,
      width: double.infinity,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(horizontal: paddingValue),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(multiplyFree(defaultSize, 1)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              multiply05(defaultSize),
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const RadioTitleBox(
              title: '위치',
            ),
            RadioButtons(
              values: widget.values,
              currentValue: _selectedValue,
              onChange: handleValue,
            ),
            SizedBox(
              width: double.infinity,
              height: multiplyFree(defaultSize, 3),
              child: ElevatedButton(
                onPressed: () {
                  widget.onSubmit(_selectedValue);
                  Navigator.pop(context);
                },
                child: Text(
                  '확인',
                  style: TextStyle(
                    fontSize: multiplyFree(defaultSize, 1.1),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RadioButtons extends StatefulWidget {
  const RadioButtons({
    Key? key,
    required this.values,
    required this.currentValue,
    required this.onChange,
  }) : super(key: key);

  final List<String> values;
  final String currentValue;
  final Function(String) onChange;

  @override
  State<RadioButtons> createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<RadioButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: multiplyFree(defaultSize, 1)),
      child: GridView.count(
        padding: const EdgeInsets.all(0),
        childAspectRatio: 5,
        crossAxisCount: 2,
        shrinkWrap: true,
        crossAxisSpacing: multiplyFree(defaultSize, 1),
        children: List.generate(widget.values.length, (index) {
          final String entry = widget.values[index];
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              widget.onChange(entry);
            },
            child: SizedBox(
              width: double.infinity / 2,
              height: multiplyFree(defaultSize, 3),
              child: Row(
                children: [
                  CustomRadioButton(checked: widget.currentValue == entry),
                  SizedBox(width: multiplyFree(defaultSize, 0.5)),
                  Text(
                    entry,
                    style: TextStyle(
                      fontSize: multiplyFree(defaultSize, 1.3),
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class RadioTitleBox extends StatelessWidget {
  const RadioTitleBox({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: multiplyFree(defaultSize, 1)),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black12,
          ),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: multiplyFree(defaultSize, 1.3),
          color: Colors.black,
          fontWeight: FontWeight.w600,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
