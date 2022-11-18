import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_product.dart';
import 'package:pet_app/constant.dart';
import 'package:pet_app/styles.dart';

class ListProduct extends ConsumerStatefulWidget {
  const ListProduct({
    Key? key,
    required this.productList,
  }) : super(key: key);

  final List<MungroadProduct> productList;

  @override
  ListProductState createState() => ListProductState();
}

class ListProductState extends ConsumerState<ListProduct> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int idx) {
              MungroadProduct currentProduct = widget.productList[idx];
              int targetPath = ((currentProduct.id / 50).floor() * 50);
              print(targetPath);
              String? typeEng = mungroadTypeEng[currentProduct.type];

              String imagePath =
                  '$imageServerName/image/$typeEng/$targetPath/${currentProduct.id}/${currentProduct.images[0].fileName}';

              return PreviewContainer(
                fileName: imagePath,
                child: const Text('hihi'),
              );
            },
            childCount: widget.productList.length,
          ),
        )
      ],
      controller: ScrollController(),
    );
  }
}

class PreviewContainer extends StatelessWidget {
  const PreviewContainer({
    Key? key,
    required this.child,
    required this.fileName,
  }) : super(key: key);

  final Widget child;
  final String fileName;

  @override
  Widget build(BuildContext context) {
    print(fileName);
    return Container(
      width: 100,
      height: multiplyFree(defaultSize, 20),
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.1,
          color: Colors.black,
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(fileName),
        ),
      ),
      child: child,
    );
  }
}
