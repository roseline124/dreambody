const String getUserInfo = r'''
  query getUserInfo {
    userInfo {
        id
        currentWeight
        dailyIntakeCalorie
        dateOfBirth
        goalWeight
        height
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
        user {
            id
            name
            email
            emailVerified
            provider
            providerId
        }
    }
}
''';
