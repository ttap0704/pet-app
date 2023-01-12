import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommonState {
  int tabNumber;
  String accommodationLocation;
  String restaurantLocation;

  CommonState setTabNumber({
    required int tab,
  }) {
    return CommonState(
      tab,
      accommodationLocation,
      restaurantLocation,
    );
  }

  CommonState setLocation({
    required String type,
    required String value,
  }) {
    if (type == 'accommodation') {
      return CommonState(
        tabNumber,
        value,
        restaurantLocation,
      );
    } else {
      return CommonState(
        tabNumber,
        accommodationLocation,
        value,
      );
    }
  }

  CommonState(
    this.tabNumber,
    this.accommodationLocation,
    this.restaurantLocation,
  );
}

class CommonNotifier extends StateNotifier<CommonState> {
  CommonNotifier() : super(CommonState(0, '전체', '전체'));

  void setTabNumber(int tab) {
    state = state.setTabNumber(tab: tab);
  }

  void setLocation(String type, String value) {
    state = state.setLocation(type: type, value: value);
  }
}

final commonProvider =
    StateNotifierProvider<CommonNotifier, CommonState>((ref) {
  return CommonNotifier();
});
