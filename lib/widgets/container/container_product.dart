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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(multiply05(defaultSize)),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          ContainerImageSlider(
            targetId: widget.product.id,
            images: widget.product.images,
            category: widget.category,
          ),
        ],
      ),
    );
  }
}
