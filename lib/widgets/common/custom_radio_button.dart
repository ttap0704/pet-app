import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_colors.dart';

class CustomRadioButton extends ConsumerStatefulWidget {
  const CustomRadioButton({Key? key, required this.checked}) : super(key: key);

  final bool checked;

  @override
  CustomRadioButtonState createState() => CustomRadioButtonState();
}

class CustomRadioButtonState extends ConsumerState<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedOpacity(
          opacity: widget.checked ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 100),
          child: const Icon(
            Icons.radio_button_checked,
            color: MungroadColors.orange,
          ),
        ),
        AnimatedOpacity(
          opacity: widget.checked ? 0.0 : 1.0,
          duration: const Duration(milliseconds: 100),
          child: const Icon(
            Icons.radio_button_unchecked,
            color: Colors.black12,
          ),
        ),
      ],
    );
  }
}
