import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
  String _selectedIdx = '';

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
            // ...widget.values.map((entry) {
            //   int idx = widget.values.indexOf(entry);
            //   return Radio<String>(
            //     value: entry,
            //     groupValue: _selectedIdx,
            //     onChanged: (String? value) {
            //       setState(() {
            //         _selectedIdx = value!;
            //       });
            //     },
            //   );
            // }).toList(),
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
