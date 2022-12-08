import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_product.dart';
import 'package:pet_app/constant.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/util/mungroad_scroll_controller.dart';
import 'package:pet_app/util/mungroad_tools.dart';
import 'package:pet_app/views/accommodation/detail.dart';

class ListProduct extends ConsumerStatefulWidget {
  const ListProduct({
    Key? key,
    required this.productType,
    required this.baseUrl,
    required this.options,
  }) : super(key: key);

  final int productType;
  final String baseUrl;
  final MungroadListOptions options;

  @override
  ListProductState createState() => ListProductState();
}

class ListProductState extends ConsumerState<ListProduct> {
  late MungroadScrollController _listScrollController;
  List<MungroadProduct> _currentProductList = [];

  @override
  void didUpdateWidget(covariant ListProduct oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    _listScrollController.setOptions(widget.options);
    getList(true);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _listScrollController = MungroadScrollController(
        widget.productType,
        widget.baseUrl,
        2,
        widget.options,
      );
    });

    getList(true);
    _listScrollController.addListener(() {
      final maxScroll = _listScrollController.position.maxScrollExtent;
      final currentScroll = _listScrollController.position.pixels;
      if (maxScroll == currentScroll && _listScrollController.hasmore) {
        getList(false);
      }
    });
  }

  void getList(bool refresh) async {
    List<MungroadProduct> result = await _listScrollController.getList();
    setState(() {
      if (refresh == false) {
        _currentProductList = [..._currentProductList, ...result];
      } else {
        _currentProductList = [...result];
        if (result.isNotEmpty && _listScrollController.hasClients) {
          _listScrollController.jumpTo(0);
        }
      }
    });
  }

  void moveProductDetail(int id) {
    if (widget.productType == 1) {
      print('$id, ${widget.productType}');
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AccommodationDetail(
            id: id,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (_currentProductList.isNotEmpty) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int idx) {
          return PreviewContainer(
            onTap: moveProductDetail,
            product: _currentProductList[idx],
            category: widget.productType,
          );
        },
        itemCount: _currentProductList.length,
        controller: _listScrollController,
      );
    } else {
      return Container(
        constraints: BoxConstraints(
          maxHeight: multiplyFree(defaultSize, 20),
        ),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Text(
              '등록된 장소가 없습니다.',
              style: TextStyle(
                color: Colors.black54,
                fontSize: multiplyFree(defaultSize, 1),
              ),
            ),
          ],
        ),
      );
    }
  }
}

class PreviewContainer extends StatelessWidget {
  const PreviewContainer({
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

    final width = MediaQuery.of(context).size.width;
    double multiplyValue = 23;
    if (width < 500 && width >= 400) {
      multiplyValue = 18;
    } else if (width < 400 && width >= 300) {
      multiplyValue = 16;
    } else if (width < 300) {
      multiplyValue = 13;
    }

    return GestureDetector(
      onTap: () {
        onTap(product.id);
      },
      child: Container(
        height: multiplyFree(defaultSize, multiplyValue),
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
