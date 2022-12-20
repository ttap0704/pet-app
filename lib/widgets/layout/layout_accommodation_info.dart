import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_accommodation.dart';
import 'package:pet_app/classes/mungroad_peak_season.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/util/mungroad_tools.dart';
import 'package:pet_app/widgets/common/contents_title.dart';
import 'package:pet_app/widgets/table/table_info.dart';

class LayoutAccommodationInfo extends ConsumerStatefulWidget {
  const LayoutAccommodationInfo({
    Key? key,
    required this.product,
  }) : super(key: key);

  final MungroadAccommodation product;
  @override
  LayoutAccommodationInfoState createState() => LayoutAccommodationInfoState();
}

class LayoutAccommodationInfoState
    extends ConsumerState<LayoutAccommodationInfo> {
  List<List<String>> _seasonContents = [];
  List<List<String>> _priceContents = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    List<List<String>> tmpSeasonContents = [];
    for (int i = 0, leng = widget.product.seasons.length; i < leng; i++) {
      MungroadPeakSeason currentSeason = widget.product.seasons[i];
      tmpSeasonContents.add(['${currentSeason.start} ~ ${currentSeason.end}']);
    }

    _priceContents.add([
      '${MungroadTools.setPriceFormat(widget.product.priceInfo.minNormalPrice)}원 ~ ${MungroadTools.setPriceFormat(widget.product.priceInfo.maxNormalPrice)}원',
      '${MungroadTools.setPriceFormat(widget.product.priceInfo.minNormalWeekendPrice)}원 ~ ${MungroadTools.setPriceFormat(widget.product.priceInfo.maxNormalWeekendPrice)}원',
      '${MungroadTools.setPriceFormat(widget.product.priceInfo.minPeakPrice)}원 ~ ${MungroadTools.setPriceFormat(widget.product.priceInfo.maxPeakPrice)}원',
      '${MungroadTools.setPriceFormat(widget.product.priceInfo.minPeakWeekendPrice)}원 ~ ${MungroadTools.setPriceFormat(widget.product.priceInfo.maxPeakWeekendPrice)}원',
    ]);

    setState(() {
      _seasonContents = [...tmpSeasonContents];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const ContentsTitle(title: '이용 안내'),
          Container(
            width: double.infinity,
            height: multiplyFree(defaultSize, 16),
            padding: EdgeInsets.all(
              multiply05(defaultSize),
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black12,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  multiply05(defaultSize),
                ),
              ),
            ),
            child: SingleChildScrollView(
              child: Text(
                widget.product.productInfo.introdution,
                style: TextStyle(
                  fontSize: multiplyFree(defaultSize, 1),
                ),
              ),
            ),
          ),
          SizedBox(height: multiplyFree(defaultSize, 1)),
          const ContentsTitle(title: '성수기 기간 및 금액'),
          TableInfo(
            keys: const ['성수기 기간'],
            contents: _seasonContents,
          ),
          SizedBox(height: multiply05(defaultSize)),
          TableInfo(
            keys: const ['비수기', '비수기 주말', '성수기', '성수기 주말'],
            contents: _priceContents,
          ),
          SizedBox(height: multiplyFree(defaultSize, 1)),
        ]);
  }
}
