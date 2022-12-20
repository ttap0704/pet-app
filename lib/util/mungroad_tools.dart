import 'package:intl/intl.dart';
import 'package:pet_app/classes/mungroad_accommodation.dart';
import 'package:pet_app/classes/mungroad_accommodation_price.dart';
import 'package:pet_app/classes/mungroad_daily.dart';
import 'package:pet_app/classes/mungroad_image.dart';
import 'package:pet_app/classes/mungroad_peak_season.dart';
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

  static String getPriceKey(List<MungroadPeakSeason> seasons) {
    String key = '';
    bool res = false;
    String compareDate = DateFormat('1001-MM-dd').format(DateTime.now());
    for (int i = 0, leng = seasons.length; i < leng; i++) {
      MungroadPeakSeason currentSeason = seasons[i];
      String start = currentSeason.start;
      String end = currentSeason.end;
      if (DateTime.parse('1001-$start').millisecondsSinceEpoch <
          DateTime.parse('1001-$end').millisecondsSinceEpoch) {
        start = '1001-$start';
        end = '1001-$end';
      } else {
        start = '1000-$start';
        end = '1001-$end';
      }

      if (DateTime.parse(start).millisecondsSinceEpoch <=
              DateTime.parse(compareDate).millisecondsSinceEpoch &&
          DateTime.parse(end).millisecondsSinceEpoch >=
              DateTime.parse(compareDate).millisecondsSinceEpoch) {
        res = true;
        break;
      }
    }

    int day = DateTime.now().weekday;
    if (res) {
      if ([6, 7].contains(day)) {
        key = 'peak_weekend_price';
      } else {
        key = 'peak_price';
      }
    } else {
      if ([6, 7].contains(day)) {
        key = 'normal_weekend_price';
      } else {
        key = 'normal_price';
      }
    }

    return key;
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
    Map<String, int> priceInfo = {
      'minNormalPrice': 0,
      'maxNormalPrice': 0,
      'minNormalWeekendPrice': 0,
      'maxNormalWeekendPrice': 0,
      'minPeakPrice': 0,
      'maxPeakPrice': 0,
      'minPeakWeekendPrice': 0,
      'maxPeakWeekendPrice': 0,
    };
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
      if (i == 0) {
        priceInfo['minNormalPrice'] = currentRoom['normal_price'];
        priceInfo['minNormalWeekendPrice'] =
            currentRoom['normal_weekend_price'];
        priceInfo['minPeakPrice'] = currentRoom['peak_price'];
        priceInfo['minPeakWeekendPrice'] = currentRoom['peak_weekend_price'];
      }

      if (priceInfo['minNormalPrice']! > currentRoom['normal_price']) {
        priceInfo['minNormalPrice'] = currentRoom['normal_price'];
      }
      if (priceInfo['maxNormalPrice']! < currentRoom['normal_price']) {
        priceInfo['maxNormalPrice'] = currentRoom['normal_price'];
      }
      if (priceInfo['minNormalWeekendPrice']! >
          currentRoom['normal_weekend_price']) {
        priceInfo['minNormalWeekendPrice'] =
            currentRoom['normal_weekend_price'];
      }
      if (priceInfo['maxNormalWeekendPrice']! <
          currentRoom['normal_weekend_price']) {
        priceInfo['maxNormalWeekendPrice'] =
            currentRoom['normal_weekend_price'];
      }
      if (priceInfo['minPeakPrice']! > currentRoom['peak_price']) {
        priceInfo['minPeakPrice'] = currentRoom['peak_price'];
      }
      if (priceInfo['maxPeakPrice']! < currentRoom['peak_price']) {
        priceInfo['maxPeakPrice'] = currentRoom['peak_price'];
      }
      if (priceInfo['minPeakWeekendPrice']! >
          currentRoom['peak_weekend_price']) {
        priceInfo['minPeakWeekendPrice'] = currentRoom['peak_weekend_price'];
      }
      if (priceInfo['maxPeakWeekendPrice']! <
          currentRoom['peak_weekend_price']) {
        priceInfo['maxPeakWeekendPrice'] = currentRoom['peak_weekend_price'];
      }
    }

    MungroadAccommodationPrice maxPriceInfo = MungroadAccommodationPrice(
      priceInfo['minNormalPrice']!,
      priceInfo['maxNormalPrice']!,
      priceInfo['minNormalWeekendPrice']!,
      priceInfo['maxNormalWeekendPrice']!,
      priceInfo['minPeakPrice']!,
      priceInfo['maxPeakPrice']!,
      priceInfo['minPeakWeekendPrice']!,
      priceInfo['maxPeakWeekendPrice']!,
    );

    List<MungroadPeakSeason> seasons = [];
    for (int i = 0, leng = result['accommodation_peak_season'].length;
        i < leng;
        i++) {
      final currentSeason = result['accommodation_peak_season'][i];

      seasons.add(MungroadPeakSeason(
          currentSeason['id'], currentSeason['end'], currentSeason['start']));
    }

    return MungroadAccommodation(product, maxPriceInfo, rooms, seasons);
  }

  static setPriceFormat(int price) {
    NumberFormat format = NumberFormat.currency(locale: 'ko_KR', symbol: '');
    return format.format(price);
  }
}
