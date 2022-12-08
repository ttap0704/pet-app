import 'package:pet_app/classes/mungroad_image.dart';
import 'package:pet_app/classes/mungroad_product.dart';
import 'package:pet_app/classes/mungroad_room.dart';

class MungroadAccommodation {
  MungroadProduct productInfo;
  List<MungroadRoom> rooms;

  MungroadAccommodation(this.productInfo, this.rooms);
}
