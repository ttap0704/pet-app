import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/http.dart';
import 'package:pet_app/widgets/layout/layout_button_bar.dart';

class AccommodationIndex extends ConsumerStatefulWidget {
  const AccommodationIndex({Key? key}) : super(key: key);

  @override
  AccommodationIndexState createState() => AccommodationIndexState();
}

class AccommodationIndexState extends ConsumerState<AccommodationIndex> {
  String _currentTypes = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContents();
  }

  void handleButtonBar(int idx) {
    String types;
    if (idx == 0) {
      types = '1,2,3,4';
    } else {
      types = idx.toString();
    }

    setState(() {
      _currentTypes = types;
    });
  }

  void getContents() async {
    final result = await HttpApi.getApi('/accommodation?types=1,2,3,4&page=1');
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutButtonBar(
      buttonBarContents: const ['전체', '펜션', '호텔/리조트', '캠핑/글램핑', '기타'],
      onClickButton: handleButtonBar,
      child: const Text('AccommodationIndex'),
    );
  }
}
