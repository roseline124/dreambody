class Food {
  // final int id;
  final String code;
  final String name;
  final double calorie;
  final double protein;
  final double fat;
  final double carbohydrate;

  Food({
    // this.id,
    this.code,
    this.name,
    this.calorie,
    this.protein,
    this.fat,
    this.carbohydrate,
  });

  factory Food.fromJSON(Map<String, dynamic> json) {
    return Food(
      // id: json['id'],
      code: json['code'],
      name: json['name'],
      calorie: json['calorie'],
      protein: json['protein'],
      fat: json['fat'],
      carbohydrate: json['carbohydrate'],
    );
  }
}
