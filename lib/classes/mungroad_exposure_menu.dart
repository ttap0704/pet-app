import 'mungroad_image.dart';

class MungroadExposureMenu {
  int id;
  String label;
  int price;
  String comment;
  List<MungroadImage> images;

  MungroadExposureMenu(
    this.id,
    this.label,
    this.price,
    this.comment,
    this.images,
  );
}
