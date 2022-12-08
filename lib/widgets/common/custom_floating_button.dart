import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_colors.dart';
import 'package:pet_app/styles.dart';

class CustomFloatingButton extends ConsumerStatefulWidget {
  const CustomFloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  CustomFloatingButtonState createState() => CustomFloatingButtonState();
}

class CustomFloatingButtonState extends ConsumerState<CustomFloatingButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: multiplyFree(defaultSize, 4),
      height: multiplyFree(defaultSize, 4),
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: () {
            print('hihi');
          },
          backgroundColor: MungroadColors.orange,
          foregroundColor: Colors.white,
          child: Icon(
            Icons.add,
            size: multiplyFree(defaultSize, 3),
          ),
        ),
      ),
    );
    ;
  }
}
