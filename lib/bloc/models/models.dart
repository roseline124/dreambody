import 'dart:convert';

import 'package:flutter/material.dart';

class UserInfo{
  final int counter_;
  final int weight_;
  /*
  final String _id;
  final double _currentWeight;
  final int _dailyIntakeCalorie;
  final String _dateOfBirth;
  final int _goalWeight;
  final int _height;
  final int _gender; // id, gender
  final int _goal; // id, goal
  final int _activity; // id, activity
  */
  const UserInfo({
    this.counter_,
    this.weight_,
  });

  UserInfo concat(Map<String,dynamic> json){
    final int _counter = json['counter'] == null ?  counter_ : json['counter'];
    final int _weight = json['counter'] == null ?  weight_ : json['counter'];

    return UserInfo(counter_: _counter, weight_:_weight);
  }
  
  int get counter => counter_;
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