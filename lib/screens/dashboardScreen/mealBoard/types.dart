// import 'package:json_serializable/json_serializable.dart';
import 'package:json_annotation/json_annotation.dart';

enum MealType { BREAKFAST, LUNCH, DINNER, DESSERT }

class FoodSum {
  dynamic calorie;
  dynamic fat;
  dynamic protein;
  dynamic carbohydrate;

  FoodSum({
    this.calorie = 0,
    this.fat = 0,
    this.protein = 0,
    this.carbohydrate = 0,
  });

  factory FoodSum.fromJSON(Map<String, dynamic> json) {
    return FoodSum(
      calorie: json['calorie'],
      protein: json['protein'],
      fat: json['fat'],
      carbohydrate: json['carbohydrate'],
    );
  }
}

@JsonSerializable(nullable: false)
class FoodInfoRequest {
  String code = '';
  String name = '';
  String registrationDate = '';
  String mealType;
  int quantity = 1;
  double calorie = 0;
  double fat = 0;
  double protein = 0;
  double carbohydrate = 0;

  FoodInfoRequest({
    this.code,
    this.name,
    this.registrationDate,
    this.mealType,
    this.quantity,
    this.calorie,
    this.fat,
    this.protein,
    this.carbohydrate,
  });

  factory FoodInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$FoodInfoRequestFromJson(json);
  Map<String, dynamic> toJson() => _$FoodInfoRequestToJson(this);
}

FoodInfoRequest _$FoodInfoRequestFromJson(Map<String, dynamic> json) {
  return FoodInfoRequest(
    code: json['code'] as String,
    name: json['name'] as String,
    registrationDate: json['registrationDate'] as String,
    mealType: json['mealType'] as String,
    quantity: json['quantity'] as int,
    calorie: json['calorie'] as double,
    fat: json['fat'] as double,
    protein: json['protein'] as double,
    carbohydrate: json['carbohydrate'] as double,
  );
}

Map<String, dynamic> _$FoodInfoRequestToJson(FoodInfoRequest instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'registrationDate': instance.registrationDate,
      'mealType': instance.mealType,
      'quantity': instance.quantity,
      'calorie': instance.calorie,
      'fat': instance.fat,
      'protein': instance.protein,
      'carbohydrate': instance.carbohydrate,
    };
