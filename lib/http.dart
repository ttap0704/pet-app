import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pet_app/constant.dart';
import 'package:dio/dio.dart';

class HttpApi {
  static Dio dio = Dio();

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

  static postImages(String url, FormData data) async {
    Response<dynamic> result =
        await dio.post('$serverName/upload/image', data: data);

    return result;
  }
}
