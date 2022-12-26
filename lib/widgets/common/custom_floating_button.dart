import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_colors.dart';
import 'package:pet_app/store/common.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/views/daily/registration.dart';

class CustomFloatingButton extends ConsumerStatefulWidget {
  const CustomFloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  CustomFloatingButtonState createState() => CustomFloatingButtonState();
}

class CustomFloatingButtonState extends ConsumerState<CustomFloatingButton> {
  void handleFloatingButton() {
    final commonWatch = ref.watch(commonProvider);
    if (commonWatch.tabNumber == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DailyRegistration(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: multiplyFree(defaultSize, 4),
      height: multiplyFree(defaultSize, 4),
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: handleFloatingButton,
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
