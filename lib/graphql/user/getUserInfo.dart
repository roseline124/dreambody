const String getUserInfo = r'''
  query GetUserInfo {
      userInfo {
          id
          currentWeight
          dailyIntakeCalorie
          dateOfBirth
          goalWeight
          height
          genderType
          goalType
          activityType
          user {
              id
              name
              email
              emailVerified
              provider
              providerId
              answeredQuestion
              profileImage
          }
      }
  }
''';
