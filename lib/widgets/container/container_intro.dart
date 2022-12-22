import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/styles.dart';

class ContainerIntro extends ConsumerStatefulWidget {
  const ContainerIntro({
    Key? key,
    required this.intro,
  }) : super(key: key);

  final String intro;

  @override
  ContainerIntroState createState() => ContainerIntroState();
}

class ContainerIntroState extends ConsumerState<ContainerIntro> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: multiplyFree(defaultSize, 16),
      padding: EdgeInsets.all(
        multiply05(defaultSize),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            multiply05(defaultSize),
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Text(
          widget.intro,
          style: TextStyle(
            fontSize: multiplyFree(defaultSize, 1),
          ),
        ),
      ),
    );
  }
}
