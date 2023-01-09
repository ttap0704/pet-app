import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_image_size.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/util/mungroad_tools.dart';

class ProfileBox extends ConsumerStatefulWidget {
  const ProfileBox({
    Key? key,
    required this.profilePath,
    required this.size,
    required this.userId,
  }) : super(key: key);

  final String profilePath;
  final double size;
  final int userId;

  @override
  ProfileBoxState createState() => ProfileBoxState();
}

class ProfileBoxState extends ConsumerState<ProfileBox> {
  late Widget _contentsWidget;

  @override
  void initState() {
    super.initState();
    setProfilePath();
  }

  @override
  void didUpdateWidget(covariant ProfileBox oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    setProfilePath();
  }

  void setProfilePath() {
    if (widget.profilePath.isEmpty) {
      _contentsWidget = Icon(
        Icons.pets,
        size: widget.size / 2,
      );
    } else {
      List<String> pathSplited = widget.profilePath.split('/');
      String fileName = pathSplited[pathSplited.length - 1];
      String imagePath = MungroadTools.getImageName(
        widget.userId,
        0,
        fileName,
        MungroadImageSize.profileSize,
      );

      _contentsWidget = Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imagePath),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String testText = '';
    if (widget.profilePath.isEmpty) {
      testText = 'ProfileBox';
    } else {
      testText = 'ProfileBox2';
    }

    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(50.0),
      ),
      clipBehavior: Clip.hardEdge,
      child: _contentsWidget,
    );
  }
}
