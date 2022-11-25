class MungroadImageSize {
  double width;
  late int accommodationSize = 1024;
  late int restaurantSize = 1024;
  late int roomsSize = 512;
  static int profileSize = 512;
  static int dailySize = 512;

  void init() {
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
  }

  MungroadImageSize(
    this.width,
  );
}
