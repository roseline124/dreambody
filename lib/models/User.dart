class User {
  final int id;
  final String name;
  final String email;
  final bool emailVerified;
  final String provider;
  final String providerId;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerified,
    this.provider,
    this.providerId,
  });

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerified: json['emailVerified'],
      provider: json['provider'],
      providerId: json['providerId'],
    );
  }
}
