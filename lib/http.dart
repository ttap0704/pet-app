import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pet_app/constant.dart';

class HttpApi {
  static getApi(String url) async {
    final Uri getUrl = Uri.parse('$serverName$url');
    final result = await http.get(getUrl);
    final resultJson = jsonDecode(result.body);

    return resultJson;
  }
}
