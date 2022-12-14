import 'package:pet_app/classes/mungroad_product.dart';
import 'package:pet_app/classes/mungroad_room.dart';
import 'package:pet_app/classes/mungroad_peak_season.dart';

class MungroadAccommodation {
  MungroadProduct productInfo;
  List<MungroadRoom> rooms;
  List<MungroadPeakSeason> seasons;

  MungroadAccommodation(this.productInfo, this.rooms, this.seasons);
}
