import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_accommodation.dart';
import 'package:pet_app/constant.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/util/mungroad_tools.dart';
import 'package:pet_app/widgets/container/container_product.dart';
import 'package:pet_app/widgets/layout/layout.dart';
import 'package:pet_app/widgets/layout/layout_contents.dart';
import 'package:pet_app/widgets/list/list_rooms.dart';
import 'package:pet_app/widgets/tabs/tabs_bar.dart';

class AccommodationDetail extends ConsumerStatefulWidget {
  const AccommodationDetail({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  AccommodationDetailState createState() => AccommodationDetailState();
}

class AccommodationDetailState extends ConsumerState<AccommodationDetail> {
  late MungroadAccommodation _accommodation;
  bool _updated = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setCurrentProduct();
  }

  setCurrentProduct() async {
    final MungroadAccommodation accommodation =
        await MungroadTools.getAccommodationDetail(widget.id);

    setState(() {
      _accommodation = accommodation;
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
                      children: [
                        ContainerProduct(
                          product: _accommodation.productInfo,
                          category: accommodationTypeNumber,
                        ),
                        SizedBox(height: multiplyFree(defaultSize, 1)),
                        TabsBar(items: const [
                          '객실/위치 정보',
                          '숙소 정보'
                        ], widgets: [
                          ListRooms(rooms: _accommodation.rooms),
                          const Text('숙소')
                        ]),
                      ],
                    ),
                  )),
            ),
          )
        : Container();
  }
}
