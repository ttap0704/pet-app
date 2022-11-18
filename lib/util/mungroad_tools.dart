import 'package:pet_app/classes/mungroad_image.dart';
import 'package:pet_app/classes/mungroad_product.dart';

class MungroadTools {
  static Future<List<MungroadProduct>> makeProduct(
      List<dynamic> result, int type) async {
    List<MungroadProduct> finalResult = [];

    String imageKey = type == 2 ? 'accommodation_images' : 'resutaurant_images';

    if (result.isNotEmpty) {
      for (int i = 0, leng = result.length; i < leng; i++) {
        final currentResult = result[i];
        final resultImages = currentResult[imageKey] as List<dynamic>;

        final List<MungroadImage> productImages = [];
        for (int y = 0, yleng = resultImages.length; y < yleng; y++) {
          final currnetImage = resultImages[y];
          final productImage = MungroadImage(
            currnetImage['id'],
            currnetImage['file_name'],
            currnetImage['category'],
            currnetImage['target_id'],
            currnetImage['seq'],
          );

          productImages.add(productImage);
        }
        final product = MungroadProduct(
          productImages,
          currentResult['id'],
          currentResult['bname'],
          currentResult['detail_address'],
          currentResult['label'],
          currentResult['type'],
          currentResult['sido'],
          currentResult['sigungu'],
          currentResult['zonecode'],
          currentResult['road_address'],
          currentResult['introduction'],
        );

        finalResult.add(product);
      }
    }

    return finalResult;
  }
}
