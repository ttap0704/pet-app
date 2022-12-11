import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_image.dart';
import 'package:pet_app/classes/mungroad_image_size.dart';
import 'package:pet_app/constant.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/util/mungroad_tools.dart';

class DialogSlider extends ConsumerStatefulWidget {
  const DialogSlider({Key? key, required this.child}) : super(key: key);

  final Widget child;
  @override
  DialogSliderState createState() => DialogSliderState();
}

class DialogSliderState extends ConsumerState<DialogSlider> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    double paddingValue = 0;
    if (width > 1000) {
      paddingValue = (width - 1000) / 2;
    }

    return Scaffold(
      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: paddingValue),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: multiplyFree(defaultSize, 3),
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(rootContext as BuildContext);
                },
                child: const Text(
                  '닫기',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            widget.child,
            SizedBox(
              height: multiplyFree(defaultSize, 3),
            ),
          ],
        ),
      ),
    );
  }
}
