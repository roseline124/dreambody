import './User.dart';

class UserInfo {
  final int id;
  final int currentWeight;
  final int dailyIntakeCalorie;
  final String dateOfBirth;
  final int goalWeight;
  final int height;
  final User user;

  UserInfo({
    this.id,
    this.currentWeight,
    this.dailyIntakeCalorie,
    this.dateOfBirth,
    this.goalWeight,
    this.height,
    this.user,
  });

  // ignore: missing_return
  factory UserInfo.fromJSON(Map<String, dynamic> json) {
    if (json != null) {
      final user = User.fromJSON(json['user']);

      return UserInfo(
        id: json['id'],
        currentWeight: json['currentWeight'],
        dailyIntakeCalorie: json['dailyIntakeCalorie'],
        dateOfBirth: json['dateOfBirth'],
        goalWeight: json['goalWeight'],
        height: json['height'],
        user: user,
      );
    }
  }
}
