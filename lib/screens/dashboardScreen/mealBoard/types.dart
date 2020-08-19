enum MealType { BREAKFAST, LUNCH, DINNER, DESSERT }

class FoodSum {
  double calorie = 0;
  double fat = 0;
  double protein = 0;
  double carbohydrate = 0;
}

class FoodInfoRequest {
  String code = '';
  String name = '';
  String registrationDate = '';
  MealType mealType;
  double quantity = 1;
  double calorie = 0;
  double fat = 0;
  double protein = 0;
  double carbohydrate = 0;
}
