import 'package:pet_app/classes/mungroad_image.dart';
import 'package:pet_app/classes/mungroad_product.dart';

class MungroadAccommodation extends MungroadProduct {
  List<MungroadImage> accommodationImages;

  MungroadAccommodation(this.accommodationImages)
      : super([], 0, '', '', '', 0, '', '', '', '', '');
}
