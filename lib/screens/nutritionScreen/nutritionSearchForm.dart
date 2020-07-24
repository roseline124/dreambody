import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flappy_search_bar/flappy_search_bar.dart';

import 'package:dreambody/config.dart';
import 'package:dreambody/models/Food.dart';

class NutritionSearchForm extends StatelessWidget {
  NutritionSearchForm({Key key, this.token});
  final String token;

  Future<List<Food>> search(String keyword) async {
    final result = await http.get('$serverBaseUrl/foodInfo?name=$keyword',
        headers: {'Authorization': 'Bearer $token'});

    final parsedResult = jsonDecode(result.body);
    final List<dynamic> foodInfos = parsedResult['I2790']['row'];
    if (foodInfos == null) {
      return [];
    }

    return List.generate(foodInfos.length, (int index) {
      final food = foodInfos[index];
      return Food(
        name: food['name'],
        carbohydrate: food['carbohydrate'],
        protein: food['protein'],
        fat: food['fat'],
      );
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: SearchBar<Food>(
      onSearch: search,
      loader: Center(child: CircularProgressIndicator()),
      hintText: "식사하신 음식의 영양소를 검색해보세요",
      hintStyle: TextStyle(color: Colors.grey),
      textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      debounceDuration: Duration(milliseconds: 500),
      emptyWidget: Center(child: Text('검색 결과가 없습니다. 다시 검색해보세요 :)')),
      onItemFound: (Food food, int index) {
        return ListTile(
          title: Text(food.name),
          subtitle: Text(
              '탄수화물: ${food.carbohydrate} / 단백질: ${food.protein} / 지방: ${food.fat}'),
        );
      },
    ));
  }
}
