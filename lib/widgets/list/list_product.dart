import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_product.dart';
import 'package:pet_app/constant.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/util/mungroad_scroll_controller.dart';
import 'package:pet_app/util/mungroad_tools.dart';
import 'package:pet_app/views/accommodation/detail.dart';
import 'package:pet_app/views/restaurant/detail.dart';

import '../container/container_preview.dart';

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
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RestaurantDetail(id: id),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AccommodationDetail(id: id),
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
          return ContainerPreview(
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
