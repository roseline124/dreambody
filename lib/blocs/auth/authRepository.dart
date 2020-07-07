class AuthRepository {
  AuthRepository();

  String token;

  Future<void> deleteToken() async {
    this.token = null;
    return;
  }

  Future<void> persistToken(String token) async {
    this.token = token;
    return;
  }

  Future<bool> hasToken() async {
    return this.token != null;
  }
}
