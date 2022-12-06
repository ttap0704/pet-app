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

  static postApi(String url, Object data) async {
    final Uri postUrl = Uri.parse('$serverName$url');
    final result = await http.post(
      postUrl,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );
    final resultJson = jsonDecode(result.body);

    return resultJson;
  }
}
