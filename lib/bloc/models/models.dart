class UserInfo{
  final String id_;
  final double currentWeight_;
  final int dailyIntakeCalorie_;
  final String dateOfBirth_;
  final int goalWeight_;
  final int height_;
  final int gender_; // id, gender
  final int goal_; // id, goal
  final int activity_; // id, activity
  
  const UserInfo({
    this.id_,
    this.currentWeight_,
    this.dailyIntakeCalorie_,
    this.dateOfBirth_,
    this.goalWeight_,
    this.gender_,
    this.height_,
    this.goal_,
    this.activity_,
  });

  UserInfo concat(Map<String,dynamic> json){
    final String _id = json['id'] == null ? id_ : json['id'];
    final double _currentWeight = json['currentWeight'] == null ? currentWeight_ : json['currentWeight'];
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
  double get currentWeight => currentWeight_;
  int get dailyIntakeCalorie => dailyIntakeCalorie_;
  String get dateOfBirth => dateOfBirth_;
  int get goalWeight => goalWeight_;
  int get height => height_;
  int get gender => gender_; // id, gender
  int get goal => goal_; // id, goal
  int get activity => activity_; 
}
/*
class UserInfo{
  final String _id;
  final double _currentWeight;
  final int _dailyIntakeCalorie;
  final String _dateOfBirth;
  final int _goalWeight;
  final int _height;
  final int _gender; // id, gender
  final int _goal; // id, goal
  final int _activity; // id, activity

  String get id => _id;
  double get currentWeight => _currentWeight;
  int get dailyIntakeCalorie => _dailyIntakeCalorie;
  String get dateOfBirth => _dateOfBirth;
  int get goalWeight => _goalWeight;
  int get height => _height;
  int get gender => _gender;
  int get goal => _goal;
  int get activity => _activity;

  UserInfo concatJson(Map<String, dynamic> json){
    String __id = json['id'] ?? this._id;
    double __currentWeight = json['currentWeight'] ?? this._currentWeight;
    int __dailyIntakeCalorie = json['dailyIntakeCalorie'] ?? this._dailyIntakeCalorie;
    String __dateOfBirth = json['dateOfBirth'] ?? this._dateOfBirth;
    int __goalWeight = json['goalWeight'] ?? this._goalWeight;
    int __height = json['height'] ?? this._height;
    int __gender = json['gender'] ?? this._gender; // id, gender
    int __goal = json['goal'] ?? this._goal; // id, goal
    int __activity = json['activity'] ?? this._activity; // id, activity

    String _json = '''{
      "id": __id,
      "currentWeight": __currentWeight,
      "dailyIntakeCalorie": __dailyIntakeCalorie,
      "dateOfBirth": __dateOfBirth,
      "goalWeight": __goalWeight,
      "height": __height,
      "gender": __gender,
      "goal": __goal,
      "activity": __activity,
    }''';

    Map<String, dynamic> _map = jsonDecode(_json) as Map<String, dynamic>;
    UserInfo _tmp = UserInfo.fromJson(_map);
    return _tmp;
  }

  UserInfo.fromJson(Map<String, dynamic> json)
  : _id = json['id'],
    _currentWeight = json['currentWeight'],
    _dailyIntakeCalorie = json['dailyIntakeCalorie'],
    _dateOfBirth = json['dateOfBirth'],
    _goalWeight = json['goalWeight'],
    _height = json['height'],
    _gender = json['gender'],
    _goal = json['goal'],
    _activity = json['activity'];

  Map<String,dynamic> toJson() => {
    'id' : _id,
    'currentWeight' : _currentWeight,
    'dailyIntakeCalorie' : _dailyIntakeCalorie,
    'dateOfBirth' : _dateOfBirth,
    'goalWeight' : _goalWeight,
    'height' : _height,
    'gender' : _gender,
    'goal' : _goal,
    'activity' : _activity,
  };
}
*/
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