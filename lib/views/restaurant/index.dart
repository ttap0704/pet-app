import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/constant.dart';
import 'package:pet_app/util/mungroad_scroll_controller.dart';
import 'package:pet_app/widgets/layout/layout_button_bar.dart';
import 'package:pet_app/widgets/list/list_product.dart';

class RestaurantIndex extends ConsumerStatefulWidget {
  const RestaurantIndex({Key? key}) : super(key: key);

  @override
  RestaurantIndexState createState() => RestaurantIndexState();
}

class RestaurantIndexState extends ConsumerState<RestaurantIndex> {
  MungroadListOptions _options = MungroadListOptions('', '', '1,2,3,4');

  String listBaseUrl = '/${mungroadTypeEng[restaurantTypeNumber]}';

  void handleButtonBar(int idx) {
    String types;
    if (idx == 0) {
      types = '1,2,3,4';
    } else {
      types = idx.toString();
    }

    setState(() {
      _options = MungroadListOptions(_options.recent, _options.location, types);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutButtonBar(
      buttonBarContents: const ['전체', '음식점', '카페', '주점/술집', '기타'],
      onClickButton: handleButtonBar,
      child: ListProduct(
        productType: restaurantTypeNumber,
        baseUrl: listBaseUrl,
        options: _options,
      ),
    );
  }
}
