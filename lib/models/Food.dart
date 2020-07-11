class FoodInfo {
  final int id;
  final String foodCode;
  final String name;
  final double protein;
  final double fat;
  final double carbohydrate;

  FoodInfo({
    this.id,
    this.foodCode,
    this.name,
    this.protein,
    this.fat,
    this.carbohydrate,
  });

  factory FoodInfo.fromJSON(Map<String, dynamic> json) {
    return FoodInfo(
      id: json['id'],
      foodCode: json['foodCode'],
      name: json['name'],
      protein: json['protein'],
      fat: json['fat'],
      carbohydrate: json['carbohydrate'],
    );
  }
}
