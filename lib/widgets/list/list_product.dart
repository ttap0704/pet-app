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
    final width = MediaQuery.of(context).size.width;

    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int idx) {
              return PreviewContainer(
                product: widget.productList[idx],
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
  const PreviewContainer({Key? key, required this.product}) : super(key: key);

  final MungroadProduct product;

  @override
  Widget build(BuildContext context) {
    MungroadProduct currentProduct = product;
    // image file name
    int targetPath = ((currentProduct.id / 50).floor() * 50);
    String? typeEng = mungroadTypeEng[currentProduct.type];
    List<String> splitedFileName = currentProduct.images[0].fileName.split('.');
    String finalFileName =
        '${splitedFileName[0]}_${imageSize.accommodationSize}.jpg';

    String imagePath =
        '$imageServerName/resize-image/$typeEng/$targetPath/${currentProduct.id}/$finalFileName';

    // label, address
    String label = currentProduct.label;
    String address =
        '${currentProduct.sido} ${currentProduct.sigungu} ${currentProduct.bname}';

    return Container(
      width: 100,
      height: multiplyFree(defaultSize, 20),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.all(Radius.circular(multiply05(defaultSize))),
        border: Border.all(
          width: 0.1,
          color: Colors.black,
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imagePath),
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(0, 0, 0, 0),
              Color.fromARGB(75, 0, 0, 0),
            ],
          ),
        ),
        padding: EdgeInsets.all(multiply15(defaultSize)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: multiply16(defaultSize),
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              address,
              style: TextStyle(
                fontSize: multiply11(defaultSize),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
