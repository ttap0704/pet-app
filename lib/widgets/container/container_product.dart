import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_product.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/widgets/container/container_image_slider.dart';

class ContainerProduct extends ConsumerStatefulWidget {
  const ContainerProduct({
    Key? key,
    required this.product,
    required this.category,
  }) : super(key: key);

  final MungroadProduct product;
  final int category;

  @override
  ContainerProductState createState() => ContainerProductState();
}

class ContainerProductState extends ConsumerState<ContainerProduct> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ContainerImageSlider(
          targetId: widget.product.id,
          images: widget.product.images,
          category: widget.category,
          useFullScreen: true,
        ),
        SizedBox(
          height: multiplyFree(defaultSize, 1),
        ),
        Text(
          widget.product.label,
          style: TextStyle(
            fontSize: multiply15(defaultSize),
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          widget.product.roadAddress,
          style: TextStyle(fontSize: multiply12(defaultSize)),
        ),
      ],
    );
  }
}
