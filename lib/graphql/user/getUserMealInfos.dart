// # 식사타입에 등록한 음식에 관련한 회원정보
// # mealTypeId(식사타입)이 있으면 해당 식사타입의 내역만 조회, 없으면 모든 식사타입의 내역을 조회
const String getUserMealInfos = r'''
  query GetUserFoodMapping($foodInfoRequest: FoodInfoRequest) {
      userFoodMapping(foodInfoRequest: $foodInfoRequest) {
          id
          quantity
          registrationDate
          mealType
          foodInfo {
              id
              code
              name
              carbohydrate
              calorie
              fat
              protein
          }
          User {
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
