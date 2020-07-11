import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class AuthService {
  Future<String> _token;

  getToken() {
    if (_token == null) {
      _token = _getToken();
    }
    return _token;
  }

  refresh() {
    _token = _getToken();
  }

  _getToken() async {
    final res = await http.post('blabla');
    final body = JSON.jsonDecode(res.body);
    return body['token'];
  }
}
