import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_image.dart';
import 'package:pet_app/styles.dart';

class DialogSlider extends ConsumerStatefulWidget {
  const DialogSlider({Key? key, required this.images}) : super(key: key);

  final List<MungroadImage> images;
  @override
  DialogSliderState createState() => DialogSliderState();
}

class DialogSliderState extends ConsumerState<DialogSlider> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      backgroundColor: Colors.black,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Container(
          width: double.infinity,
        ),
      ),
    );
  }
}
