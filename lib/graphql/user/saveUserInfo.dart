const String saveUserInfo = r'''
  mutation saveUserInfo($userInfoRequest: UserInfoRequest) {
    saveUserInfo(userInfoRequest: $userInfoRequest) {
      currentWeight
      goalWeight
      height
      dateOfBirth
      genderType
      goalType
      activityType
    }
  }
''';
