import 'package:flutter_riverpod/flutter_riverpod.dart';

class SizeState {
  double width;
  double height;

  SizeState setInitSize({required double width, required double height}) {
    return SizeState(width, height);
  }

  SizeState(this.width, this.height);
}

class SizeNotifier extends StateNotifier<SizeState> {
  SizeNotifier() : super(SizeState(0, 0));

  void setInitSize(double width, double height) {
    state = state.setInitSize(width: width, height: height);
  }
}

final sizeProvider = StateNotifierProvider<SizeNotifier, SizeState>((ref) {
  return SizeNotifier();
});
