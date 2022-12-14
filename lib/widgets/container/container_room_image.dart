import 'package:flutter/cupertino.dart';
import 'package:pet_app/classes/mungroad_image_size.dart';
import 'package:pet_app/styles.dart';

class ContainerRoomImage extends StatelessWidget {
  const ContainerRoomImage({Key? key, required this.child}) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final double maxWidth = width >= 700
        ? multiplyFree(defaultSize, 23)
        : width - multiplyFree(defaultSize, 2);

    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints(maxWidth: maxWidth),
      height: multiplyFree(defaultSize, MungroadImageSize.multiplyRoomsValue),
      child: child,
    );
  }
}
