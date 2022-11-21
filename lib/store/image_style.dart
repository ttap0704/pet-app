import 'package:hooks_riverpod/hooks_riverpod.dart';

class ImageStyleState {
  double width;
  late int accommodationSize = 1024;
  late int restaurantSize = 1024;
  late int roomsSize = 512;

  ImageStyleState setImageSize({
    required double width,
  }) {
    if (width <= 768 && width > 500) {
      accommodationSize = 768;
      restaurantSize = 768;
      if (width <= 700) {
        roomsSize = 768;
      }
    } else if (width <= 500) {
      accommodationSize = 512;
      restaurantSize = 512;
      roomsSize = 512;
    }

    return ImageStyleState(this.width);
  }

  ImageStyleState(this.width);
}

class ImageStyleNotifier extends StateNotifier<ImageStyleState> {
  ImageStyleNotifier() : super(ImageStyleState(0.0));

  void setImageSize(double width) {
    state = state.setImageSize(width: width);
  }
}

final imageStyleProvider =
    StateNotifierProvider<ImageStyleNotifier, ImageStyleState>((ref) {
  return ImageStyleNotifier();
});
