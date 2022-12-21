import 'package:pet_app/classes/mungroad_product.dart';
import 'mungroad_exposure_menu.dart';
import 'mungroad_entire_menu_category.dart';

class MungroadRestaurant {
  MungroadProduct productInfo;
  List<MungroadExposureMenu> exposureMenu;
  List<MungroadEntireMenuCategory> category;

  MungroadRestaurant(
    this.productInfo,
    this.exposureMenu,
    this.category,
  );
}
