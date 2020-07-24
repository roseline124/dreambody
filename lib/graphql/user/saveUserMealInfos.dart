// # 식사타입에 따른 식사정보 저장
const String saveUserMealInfos = r'''
  mutation SaveUserFoodMapping($foodInfoRequest: FoodInfoRequest) {
    saveUserFoodMapping(foodInfoRequest: $foodInfoRequest)
}
''';
