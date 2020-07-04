const String saveUserInfo = r'''
  mutation saveUserInfo($userInfoWrapper: UserInfoWrapper) {
    saveUserInfo(userInfoWrapper: $userInfoWrapper) {
        currentWeight
        goalWeight
        height
        dateOfBirth
        gender {
            id
            gender
        }
        goal {
            id
            goal
        }
        activity {
            id
            activity
        }
    }
}
''';
