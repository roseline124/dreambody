class AuthRepository {
  AuthRepository();

  String token;

  Future<void> deleteToken() async {
    this.token = null;
    return;
  }

  String getToken() {
    return this.token;
  }

  bool hasToken() {
    return this.token != null;
  }

  void saveToken({String token}) {
    this.token = token;
    return;
  }
}
