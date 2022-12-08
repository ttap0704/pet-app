import 'package:pet_app/classes/mungroad_image.dart';

class MungroadRoom {
  int id;
  String label;
  List<MungroadImage> images;
  int normalPrice;
  int normalWeekendPrice;
  int peakPrice;
  int peakWeekendPrice;
  String entrance;
  String leaving;
  int standardNum;
  int maximumNum;

  MungroadRoom(
    this.id,
    this.label,
    this.images,
    this.normalPrice,
    this.normalWeekendPrice,
    this.peakPrice,
    this.peakWeekendPrice,
    this.entrance,
    this.leaving,
    this.standardNum,
    this.maximumNum,
  );
}
