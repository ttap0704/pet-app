import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_colors.dart';
import 'package:pet_app/styles.dart';

class DialogRadio extends ConsumerStatefulWidget {
  const DialogRadio({Key? key, required this.child, required this.values})
      : super(key: key);

  final Widget child;
  final List<String> values;
  @override
  DialogRadioState createState() => DialogRadioState();
}

class DialogRadioState extends ConsumerState<DialogRadio> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    double paddingValue = 0;
    if (width > 1000) {
      paddingValue = (width - 1000) / 2;
    }

    return Container(
      color: Colors.transparent,
      width: double.infinity,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(horizontal: paddingValue),
      child: Container(
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.all(multiplyFree(defaultSize, 1)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const RadioTitleBox(
              title: '위치',
            ),
            RadioButtons(
              values: widget.values,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print('확인');
                },
                child: const Text('확인'),
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
  }) : super(key: key);

  final List<String> values;

  @override
  State<RadioButtons> createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<RadioButtons> {
  String _selectedValue = '';

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
              setState(() {
                _selectedValue = entry;
              });
            },
            child: SizedBox(
              width: double.infinity / 2,
              height: multiplyFree(defaultSize, 3),
              child: Row(
                children: [
                  _selectedValue == entry
                      ? const Icon(
                          Icons.radio_button_checked,
                          color: MungroadColors.orange,
                        )
                      : const Icon(
                          Icons.radio_button_unchecked,
                          color: Colors.black12,
                        ),
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
