import 'package:flutter_riverpod/flutter_riverpod.dart';

class Common extends StateNotifier<Map> {
  Common() : super({'tabNumber': int});

  void setTabNumber(int tab) {
    state['tabNumber'] = tab;
  }
}

final commonStateNotifierProvider = StateNotifierProvider<Common, Map>((ref) {
  return Common();
});
