import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonState {
  int tabNumber;

  CommonState setTabNumber({
    required int tab,
  }) {
    return CommonState(tab);
  }

  CommonState(this.tabNumber);
}

class CommonNotifier extends StateNotifier<CommonState> {
  CommonNotifier() : super(CommonState(0));

  void setTabNumber(int tab) {
    state = state.setTabNumber(tab: tab);
  }
}

final commonProvider =
    StateNotifierProvider<CommonNotifier, CommonState>((ref) {
  return CommonNotifier();
});
