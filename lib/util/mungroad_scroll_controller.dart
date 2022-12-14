import 'package:flutter/cupertino.dart';
import 'package:pet_app/classes/mungroad_comment.dart';
import 'package:pet_app/classes/mungroad_daily.dart';
import 'package:pet_app/classes/mungroad_product.dart';
import 'package:pet_app/http.dart';
import 'package:pet_app/util/mungroad_tools.dart';

class MungroadListOptions {
  String? recent;
  String? location;
  String? types;

  MungroadListOptions(this.recent, this.location, this.types);
}

class MungroadScrollController extends ScrollController {
  int productType;
  String defaultUrl;
  int take;
  MungroadListOptions? options;
  late int page = 0;
  late bool hasmore = true;

  Future<List<MungroadProduct>> getList() async {
    page = page + 1;
    String currentUrl = '$defaultUrl?page=$page';

    if (options is MungroadListOptions) {
      if (options?.recent is String) {
        currentUrl = '$currentUrl&recent=${options?.recent}';
      }

      if (options?.location is String) {
        currentUrl = '$currentUrl&location=${options?.location}';
      }

      if (options?.types is String) {
        currentUrl = '$currentUrl&types=${options?.types}';
      }
    }

    final result = await HttpApi.getApi(currentUrl);
    List<MungroadProduct> currentList =
        await MungroadTools.makeProduct(result, productType);

    if (currentList.length < take) {
      hasmore = false;
    }

    return currentList;
  }

  Future<List<MungroadDaily>> getDailyList() async {
    page = page + 1;
    String currentUrl = '/daily?page=$page';

    final result = await HttpApi.getApi(currentUrl);
    List<MungroadDaily> currentList = await MungroadTools.makeDaily(result);

    if (currentList.length < take) {
      hasmore = false;
    }

    return currentList;
  }

  Future<List<MungroadComment>> getComments() async {
    page = page + 1;
    String currentUrl = '$defaultUrl?page=$page';

    final result = await HttpApi.getApi(currentUrl);
    final List<MungroadComment> currentList = [];
    for (int i = 0, leng = result.length; i < leng; i++) {
      final currentComment = result[i];
      currentList.add(
        MungroadComment(
            currentComment['id'],
            currentComment['comment'],
            currentComment['nickname'],
            currentComment['profile_path'] ?? '',
            currentComment['writer_id'],
            currentComment['created_at']),
      );
    }

    if (currentList.length < take) {
      hasmore = false;
    }

    return currentList;
  }

  void setOptions(MungroadListOptions currentOptions) {
    options = currentOptions;
    page = 0;
  }

  MungroadScrollController(
    this.productType,
    this.defaultUrl,
    this.take,
    this.options,
  );
}
