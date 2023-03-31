import 'package:http/http.dart' as http;

class AuthApi {
  Future<http.Response> login(email, password) {
    return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  }
}
