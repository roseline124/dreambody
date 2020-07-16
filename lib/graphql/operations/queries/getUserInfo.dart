const String getUserInfo = r'''
  query getUser {
    getUserInfo {
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
