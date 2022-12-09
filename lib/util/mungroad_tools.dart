import 'package:pet_app/classes/mungroad_accommodation.dart';
import 'package:pet_app/classes/mungroad_daily.dart';
import 'package:pet_app/classes/mungroad_image.dart';
import 'package:pet_app/classes/mungroad_product.dart';
import 'package:pet_app/classes/mungroad_room.dart';
import 'package:pet_app/constant.dart';
import 'package:pet_app/http.dart';

class MungroadTools {
  static Future<List<MungroadProduct>> makeProduct(
      List<dynamic> result, int type) async {
    List<MungroadProduct> finalResult = [];

    String imageKey = '${mungroadTypeEng[type]}_images';

    if (result.isNotEmpty) {
      for (int i = 0, leng = result.length; i < leng; i++) {
        final currentResult = result[i];
        final resultImages = currentResult[imageKey] as List<dynamic>;

        final List<MungroadImage> productImages = setImageList(resultImages);

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
          '',
          '',
          '',
          '',
        );

        finalResult.add(product);
      }
    }

    return finalResult;
  }

  static Future<List<MungroadDaily>> makeDaily(List<dynamic> result) async {
    List<MungroadDaily> finalResult = [];

    if (result.isNotEmpty) {
      for (int i = 0, leng = result.length; i < leng; i++) {
        final currentResult = result[i];
        final resultImages = currentResult['image_list'] as List<dynamic>;

        final List<MungroadImage> productImages = setImageList(resultImages);

        final daily = MungroadDaily(
          productImages,
          currentResult['id'],
          currentResult['comment_count'],
          currentResult['contents'],
          currentResult['image_count'],
          currentResult['likes_count'],
          currentResult['nickname'],
          currentResult['profile_path'] ?? '',
          currentResult['writer_id'],
          currentResult['created_at'],
        );

        finalResult.add(daily);
      }
    }

    return finalResult;
  }

  static List<MungroadImage> setImageList(List<dynamic> resultImages) {
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

    return productImages;
  }

  static String getImageName(int id, int category, String fileName, int size) {
    int targetPath = ((id / 50).floor() * 50);
    String? typeEng = mungroadTypeEng[category];
    List<String> splitedFileName = fileName.split('.');
    String finalFileName = '${splitedFileName[0]}_$size.jpg';

    print('$targetPath : targetPath, $id: id');

    String imagePath =
        '$imageServerName/resize-image/$typeEng/$targetPath/$id/$finalFileName';

    return imagePath;
  }

  static String getWriteDate(createdAt) {
    String currentWriteDate = '';

    DateTime writeDate = DateTime.parse(createdAt);

    int compareDateTime = writeDate.millisecondsSinceEpoch;
    int nowDateTime = DateTime.now().millisecondsSinceEpoch;
    int gap = nowDateTime - compareDateTime;

    int oneminute = 1000 * 60;
    int oneHour = oneminute * 60;
    int oneDay = oneHour * 24;
    int oneWeek = oneDay * 7;

    if (gap < oneHour) {
      currentWriteDate = '${(gap / oneminute).floor()}분 전';
    } else if (gap >= oneHour && gap < oneDay) {
      currentWriteDate = '${(gap / oneHour).floor()}시간 전';
    } else if (gap >= oneDay && gap < oneWeek) {
      currentWriteDate = '${(gap / oneDay).floor()}일 전';
    } else {
      currentWriteDate = writeDate.toString().substring(0, 10);
    }

    return currentWriteDate;
  }

  static Future<MungroadAccommodation> getAccommodationDetail(int id) async {
    final result = await HttpApi.getApi('/accommodation/$id');
    final List<MungroadImage> productImages =
        setImageList(result['accommodation_images']);
    final product = MungroadProduct(
      productImages,
      result['id'],
      result['bname'],
      result['detail_address'],
      result['label'],
      result['type'],
      result['sido'],
      result['sigungu'],
      result['zonecode'],
      result['road_address'],
      result['introduction'],
      result['building_name'],
      result['contact'],
      result['site'],
      result['kakao_chat'],
    );

    final List<MungroadRoom> rooms = [];
    for (int i = 0, leng = result['accommodation_rooms'].length;
        i < leng;
        i++) {
      final currentRoom = result['accommodation_rooms'][i];

      final List<MungroadImage> roomImages =
          setImageList(currentRoom['rooms_images']);
      final MungroadRoom tmpRoom = MungroadRoom(
        currentRoom['id'],
        currentRoom['label'],
        roomImages,
        currentRoom['normal_price'],
        currentRoom['normal_weekend_price'],
        currentRoom['peak_price'],
        currentRoom['peak_weekend_price'],
        currentRoom['entrance'],
        currentRoom['leaving'],
        currentRoom['standard_num'],
        currentRoom['maximum_num'],
      );
      rooms.add(tmpRoom);
    }

    return MungroadAccommodation(product, rooms);
  }
}
