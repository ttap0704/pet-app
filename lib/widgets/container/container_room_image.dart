import 'package:flutter/cupertino.dart';
import 'package:pet_app/styles.dart';

class ContainerRoomImage extends StatelessWidget {
  const ContainerRoomImage({Key? key, required this.child}) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      alignment: Alignment.center,
      width: multiplyFree(defaultSize, 23),
      height: 30,
      child: child,
    );
  }
}
