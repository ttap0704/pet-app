import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_accommodation.dart';
import 'package:pet_app/classes/mungroad_peak_season.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    List<List<String>> tmpSeasonContents = [];
    for (int i = 0, leng = widget.product.seasons.length; i < leng; i++) {
      MungroadPeakSeason currentSeason = widget.product.seasons[i];
      tmpSeasonContents.add(['${currentSeason.start} ~ ${currentSeason.end}']);
    }

    setState(() {
      _seasonContents = [...tmpSeasonContents];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ContentsTitle(title: '이용 안내'),
          TableInfo(
            keys: ['성수기 기간'],
            contents: _seasonContents,
          ),
          ContentsTitle(title: '성수기 기간 및 금액'),
        ]);
  }
}
