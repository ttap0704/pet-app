import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_product.dart';

class ContainerProduct extends ConsumerStatefulWidget {
  const ContainerProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  final MungroadProduct product;

  @override
  ContainerProductState createState() => ContainerProductState();
}

class ContainerProductState extends ConsumerState<ContainerProduct> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        widget.product.label,
      ),
    );
  }
}
