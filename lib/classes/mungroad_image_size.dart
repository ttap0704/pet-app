class MungroadImageSize {
  double width;
  late int accommodationSize = 1024;
  late int restaurantSize = 1024;
  late int roomsSize = 512;
  static double multiplyValue = 23;
  static double multiplyRoomsValue = 12;
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

    if (width >= 500 && width < 700) {
      multiplyRoomsValue = 20;
    } else if (width < 500 && width >= 400) {
      multiplyValue = 18;
      multiplyRoomsValue = 17;
    } else if (width < 400 && width >= 300) {
      multiplyValue = 16;
      multiplyRoomsValue = 15;
    } else if (width < 300) {
      multiplyValue = 13;
      multiplyRoomsValue = 12;
    } else {
      multiplyValue = 23;
      multiplyRoomsValue = 12;
    }
  }

  MungroadImageSize(
    this.width,
  );
}
