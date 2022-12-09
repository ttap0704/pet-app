import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/classes/mungroad_image_size.dart';
import 'package:pet_app/classes/mungroad_product.dart';
import 'package:pet_app/constant.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/util/mungroad_tools.dart';

class ContainerPreview extends StatelessWidget {
  const ContainerPreview({
    Key? key,
    required this.product,
    required this.category,
    required this.onTap,
  }) : super(key: key);

  final MungroadProduct product;
  final int category;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    MungroadProduct currentProduct = product;
    // image file name
    int size = 0;
    if (category == accommodationTypeNumber) {
      size = imageSize.accommodationSize;
    } else if (category == restaurantTypeNumber) {
      size = imageSize.accommodationSize;
    }
    String imagePath = MungroadTools.getImageName(
      currentProduct.id,
      category,
      currentProduct.images[0].fileName,
      size,
    );

    // label, address
    String label = currentProduct.label;
    String address =
        '${currentProduct.sido} ${currentProduct.sigungu} ${currentProduct.bname}';

    return GestureDetector(
      onTap: () {
        onTap(product.id);
      },
      child: Container(
        height: multiplyFree(defaultSize, MungroadImageSize.multiplyValue),
        margin: EdgeInsets.only(bottom: multiply09(defaultSize)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(multiply05(defaultSize)),
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
      ),
    );
  }
}
