import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_restaurant.dart';
import 'package:pet_app/constant.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/util/mungroad_tools.dart';
import 'package:pet_app/widgets/common/contents_title.dart';
import 'package:pet_app/widgets/container/container_intro.dart';
import 'package:pet_app/widgets/container/container_product.dart';
import 'package:pet_app/widgets/layout/layout.dart';
import 'package:pet_app/widgets/layout/layout_contents.dart';
import 'package:pet_app/widgets/list/list_entire_menu.dart';
import 'package:pet_app/widgets/list/list_exposure_menu.dart';
import 'package:pet_app/widgets/list/list_rooms.dart';
import 'package:pet_app/widgets/tabs/tabs_bar.dart';

class RestaurantDetail extends ConsumerStatefulWidget {
  const RestaurantDetail({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  RestaurantDetailState createState() => RestaurantDetailState();
}

class RestaurantDetailState extends ConsumerState<RestaurantDetail> {
  late MungroadRestaurant _restaurant;
  bool _updated = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setCurrentProduct();
  }

  setCurrentProduct() async {
    final MungroadRestaurant restaurant =
        await MungroadTools.getRestaurantDetail(widget.id);

    setState(() {
      _restaurant = restaurant;
      _updated = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _updated
        ? Layout(
            title: 'test',
            useFloatingButton: false,
            useBackButton: true,
            useNavBar: false,
            child: LayoutContents(
              child: Container(
                  height: double.infinity - 60.0,
                  padding: EdgeInsets.symmetric(
                    vertical: multiply14(defaultSize),
                    horizontal: multiply12(defaultSize),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ContainerProduct(
                          product: _restaurant.productInfo,
                          category: restaurantTypeNumber,
                        ),
                        SizedBox(height: multiplyFree(defaultSize, 2)),
                        const ContentsTitle(title: '대표메뉴'),
                        ListExposureMenu(
                          exposureMenu: _restaurant.exposureMenu,
                        ),
                        SizedBox(height: multiplyFree(defaultSize, 2)),
                        const ContentsTitle(title: '전체메뉴'),
                        ListEntireMenu(category: _restaurant.category),
                        SizedBox(height: multiplyFree(defaultSize, 2)),
                        const ContentsTitle(title: '이용안내'),
                        ContainerIntro(
                            intro: _restaurant.productInfo.introdution),
                      ],
                    ),
                  )),
            ),
          )
        : Container();
  }
}
