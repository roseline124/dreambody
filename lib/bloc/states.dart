import 'package:meta/meta.dart';
import 'dart:convert';
import './models.dart';

@immutable
class UserInfoState {
  final UserInfo userInfo;

  UserInfoState({
    this.userInfo,
  });

  factory UserInfoState.empty() {
    return UserInfoState(userInfo: UserInfo());
  }

  UserInfoState update({
    String rawJson,
  }) {
    return copyWith(rawJson: rawJson);
  }

  UserInfoState copyWith({
    String rawJson,
  }) {
    Map<String, dynamic> map = jsonDecode(rawJson) as Map<String, dynamic>;
    UserInfo _info = userInfo.concatJson(map);
    
    return UserInfoState(userInfo: _info);
  }
}