import 'dart:convert';

class UserInfo{
  const UserInfo({
    this.id,
    this.currentWeight,
    this.dailyIntakeCalorie,
    this.dateOfBirth,
    this.goalWeight,
    this.height,
    this.gender,
    this.goal,
    this.activity,
    this.user,
  });

  final String id;
  final double currentWeight;
  final int dailyIntakeCalorie;
  final String dateOfBirth;
  final int goalWeight;
  final int height;
  final int gender; // id, gender
  final int goal; // id, goal
  final int activity; // id, activity
  final User user;

  UserInfo concatJson(Map<String, dynamic> json){
    String _id = json['id'] ?? this.id;
    double _currentWeight = json['currentWeight'] ?? this.currentWeight;
    int _dailyIntakeCalorie = json['dailyIntakeCalorie'] ?? this.dailyIntakeCalorie;
    String _dateOfBirth = json['dateOfBirth'] ?? this.dateOfBirth;
    int _goalWeight = json['goalWeight'] ?? this.goalWeight;
    int _height = json['height'] ?? this.height;
    int _gender = json['gender'] ?? this.gender; // id, gender
    int _goal = json['goal'] ?? this.goal; // id, goal
    int _activity = json['activity'] ?? this.activity; // id, activity
    User _user = json['user'] ?? this.user;

    String _json = '''{
      "id": _id,
      "currentWeight": _currentWeight,
      "dailyIntakeCalorie": _dailyIntakeCalorie,
      "dateOfBirth": _dateOfBirth,
      "goalWeight": _goalWeight,
      "height": _height,
      "gender": _gender,
      "goal": _goal,
      "activity": _activity,
      "user": _user,
    }''';

    Map<String, dynamic> _map = jsonDecode(_json) as Map<String, dynamic>;
    UserInfo _tmp = UserInfo.fromJson(_map);
    return _tmp;
  }

  UserInfo.fromJson(Map<String, dynamic> json)
  : id = json['id'],
    currentWeight = json['currentWeight'],
    dailyIntakeCalorie = json['dailyIntakeCalorie'],
    dateOfBirth = json['dateOfBirth'],
    goalWeight = json['goalWeight'],
    height = json['height'],
    gender = json['gender'],
    goal = json['goal'],
    activity = json['activity'],
    user = json['user'];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'currentWeight' : currentWeight,
    'dailyIntakeCalorie' : dailyIntakeCalorie,
    'dateOfBirth' : dateOfBirth,
    'goalWeight' : goalWeight,
    'height' : height,
    'gender' : gender,
    'goal' : goal,
    'activity' : activity,
    'user' : user,
  };
}

class User{
  const User({
    this.id,
    this.name,
    this.email,
    this.emailVerified,
    this.provider,
    this.providerId
  });

  final String id;
  final String name;
  final String email;
  final bool emailVerified;
  final String provider;
  final String providerId;

  User.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'],
      email = json['email'],
      emailVerified = json['emailVerified'],
      provider = json['provider'],
      providerId = json['providerId'];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'email' : email,
    'emailVerified' : emailVerified,
    'provider' : provider,
    'providerId' : providerId
  };
}