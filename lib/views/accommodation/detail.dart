import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_accommodation.dart';
import 'package:pet_app/constant.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/util/mungroad_tools.dart';
import 'package:pet_app/widgets/container/container_product.dart';
import 'package:pet_app/widgets/layout/layout.dart';
import 'package:pet_app/widgets/layout/layout_contents.dart';

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
            child: LayoutContents(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: multiply14(defaultSize),
                  horizontal: multiply12(defaultSize),
                ),
                child: Column(
                  children: [
                    ContainerProduct(
                      product: _accommodation.productInfo,
                      category: accommodationTypeNumber,
                    )
                  ],
                ),
              ),
            ),
          )
        : Container();
  }
}
