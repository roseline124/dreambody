class UserInfo{
  final String id_;
  final int currentWeight_;
  final int dailyIntakeCalorie_;
  final String dateOfBirth_;
  final int goalWeight_;
  final int height_;
  final int gender_; // id, gender
  final int goal_; // id, goal
  final int activity_; // id, activity
  
  const UserInfo({
    this.id_ = "",
    this.currentWeight_ = 0,
    this.dailyIntakeCalorie_ = 0,
    this.dateOfBirth_ = "19000101",
    this.goalWeight_ = 0,
    this.gender_ = 0,
    this.height_ = 0,
    this.goal_ = 0,
    this.activity_ = 0,
  });

  UserInfo concat(Map<String,dynamic> json){
    final String _id = json['id'] == null ? id_ : json['id'];
    final int _currentWeight = json['currentWeight'] == null ? currentWeight_ : json['currentWeight'];
    final int _dailyIntakeCalorie = json['dailyIntakeCalorie'] == null ? dailyIntakeCalorie_ : json['dailyIntakeCalorie'];
    final String _dateOfBirth = json['dateOfBirth'] == null ? dateOfBirth_ : json['dateOfBirth'];
    final int _goalWeight = json['goalWeight'] == null ? goalWeight_ : json['goalWeight'];
    final int _height = json['height'] == null ? height_ : json['height'];
    final int _gender = json['gender'] == null ? gender_ : json['gender'];
    final int _goal = json['goal'] == null ? goal_ : json['goal'];
    final int _activity = json['activity'] == null ? activity_ : json['activity'];

    return UserInfo(
      id_: _id,
      currentWeight_: _currentWeight,
      dailyIntakeCalorie_: _dailyIntakeCalorie,
      dateOfBirth_: _dateOfBirth,
      goalWeight_: _goalWeight,
      gender_: _gender,
      height_: _height,
      goal_: _goal,
      activity_: _activity,
    );
  }
  
  String get id => id_;
  int get currentWeight => currentWeight_;
  int get dailyIntakeCalorie => dailyIntakeCalorie_;
  String get dateOfBirth => dateOfBirth_;
  int get goalWeight => goalWeight_;
  int get height => height_;
  int get gender => gender_; // id, gender
  int get goal => goal_; // id, goal
  int get activity => activity_; 
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

