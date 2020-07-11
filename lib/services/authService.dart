class AuthService {
  String _token;

  getToken() {
    if (_token == null) {
      _token = saveToken();
    }
    return _token;
  }

  saveToken({token: String}) {
    _token = token;
  }
}
