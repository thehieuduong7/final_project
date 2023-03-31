import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;

class BaseApi {
  static String? accessToken;

  Future<http.Response> privateRequest(
      String method, Uri url, Map<String, dynamic>? body) async {
    switch (method) {
      case "get":
        return await http.get(url);
      case "post":
        return await http
            .post(url, body: body, headers: {"Authorization": "Some token"});
      case "put":
        return await http
            .put(url, body: body, headers: {"Authorization": "Some token"});
      default:
        return await http
            .delete(url, body: body, headers: {"Authorization": "Some token"});
    }
  }

  void setAccessToken(String token) {
    accessToken = token;
  }
}
