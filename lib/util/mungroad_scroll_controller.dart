import 'package:flutter/cupertino.dart';
import 'package:pet_app/classes/mungroad_image.dart';
import 'package:pet_app/classes/mungroad_product.dart';
import 'package:pet_app/http.dart';
import 'package:pet_app/util/mungroad_tools.dart';

class MungroadListOptions {
  String? recent;
  String? location;

  MungroadListOptions(this.recent, this.location);
}

class MungroadScrollController extends ScrollController {
  int productType;
  String defaultUrl;
  int take;
  MungroadListOptions? options;
  late int page = 1;

  Future<List<MungroadProduct>> getList() async {
    String currentUrl = '$defaultUrl?page=${page + 1}&types=1,2,3,4';

    if (options is MungroadListOptions) {
      if (options?.recent is String) {
        currentUrl = '$currentUrl&recent=${options?.recent}';
      }
    }

    final result = HttpApi.getApi(currentUrl);
    List<MungroadProduct> tmpPoductList =
        await MungroadTools.makeProduct(result, productType);

    return tmpPoductList;
  }

  MungroadScrollController(
      this.productType, this.defaultUrl, this.take, this.options);
}
