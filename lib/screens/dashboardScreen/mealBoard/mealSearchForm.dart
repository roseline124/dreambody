import 'dart:ui';
import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:dreambody/config.dart';
import 'package:dreambody/models/Food.dart';
import './drawerMenu.dart';
import './types.dart';

class MealSearchForm extends StatefulWidget {
  MealSearchForm(
      {@required this.token,
      this.mealType,
      this.refetchQuery,
      this.selectedDate});
  final String token;
  final MealType mealType;
  final Function refetchQuery;
  final String selectedDate;

  @override
  _MealSearchFormState createState() => _MealSearchFormState();
}

class _MealSearchFormState extends State<MealSearchForm> {
  Future<List<Food>> search(String keyword) async {
    final result = await http.get('$serverBaseUrl/foodInfo?name=$keyword',
        headers: {'Authorization': 'Bearer ${widget.token}'});

    final parsedResult = jsonDecode(result.body);
    final List<dynamic> foodInfos = parsedResult['I2790']['row'];
    if (foodInfos == null) {
      return [];
    }

    return List.generate(foodInfos.length, (int index) {
      final food = foodInfos[index];
      return Food(
        code: food['code'],
        name: food['name'],
        carbohydrate: food['carbohydrate'],
        protein: food['protein'],
        fat: food['fat'],
        calorie: food['calorie'],
      );
    });
  }

  bool showBottomMenu = false;
  List<Food> selectedFoods = [];

  static const Widget _NotFoundText =
      Center(child: Text('검색 결과가 없습니다. 다시 검색해보세요 :)'));

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var threshold = 100;
    removeSelectedFood({@required int index}) {
      setState(() {
        selectedFoods.removeAt(index);
      });
    }

    return Mutation(
      options: MutationOptions(
          documentNode: gql(saveMeal),
          onCompleted: (onValue) {
            widget.refetchQuery();
          }),
      builder: (
        RunMutation saveMeal,
        QueryResult result,
      ) {
        return SafeArea(
          child: Scaffold(
            body: GestureDetector(
              onPanEnd: (details) {
                if (details.velocity.pixelsPerSecond.dy > threshold) {
                  this.setState(() {
                    showBottomMenu = false;
                  });
                } else if (details.velocity.pixelsPerSecond.dy < -threshold) {
                  this.setState(() {
                    showBottomMenu = true;
                  });
                }
              },
              child: Container(
                height: height,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        height: height,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BackButton(
                                      color: Theme.of(context).primaryColor,
                                      onPressed: () =>
                                          Navigator.of(context).pop()),
                                  InkWell(
                                    onTap: () {
                                      final foodInfoInputs =
                                          selectedFoods.map((Food food) {
                                        FoodInfoRequest foodInfo =
                                            FoodInfoRequest();
                                        if (food != null) {
                                          MealType mealType = widget.mealType;

                                          foodInfo.code = food.code;
                                          foodInfo.name = food.name;
                                          foodInfo.mealType = mealType
                                              .toString()
                                              .split('.')
                                              .last;
                                          foodInfo.registrationDate =
                                              widget.selectedDate;

                                          foodInfo.quantity = 1;
                                          foodInfo.calorie = food.calorie;
                                          foodInfo.fat = food.fat;
                                          foodInfo.protein = food.protein;
                                          foodInfo.carbohydrate =
                                              food.carbohydrate;
                                        }
                                        return foodInfo;
                                      }).toList();

                                      saveMeal(
                                          {'foodInfoRequest': foodInfoInputs});

                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      '완료',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: height - 60,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: SearchBar<Food>(
                                onSearch: search,
                                loader:
                                    Center(child: CircularProgressIndicator()),
                                hintText: "식사하신 음식의 영양소를 검색해보세요",
                                hintStyle: TextStyle(color: Colors.grey),
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                debounceDuration: Duration(milliseconds: 500),
                                onError: (error) {
                                  print(error.toString());
                                  return _NotFoundText;
                                },
                                emptyWidget: _NotFoundText,
                                onItemFound: (Food food, int index) {
                                  return Column(
                                    children: [
                                      ListTile(
                                        onTap: () {
                                          this.setState(() {
                                            selectedFoods.add(food);
                                          });
                                        },
                                        title: Text(
                                            '${food.name} (칼로리: ${food.calorie})'),
                                        subtitle: Text(
                                            '탄수화물: ${food.carbohydrate} / 단백질: ${food.protein} / 지방: ${food.fat}'),
                                      ),
                                      Divider(
                                        color: Colors.grey[300],
                                        height: 20,
                                        thickness: 1,
                                        indent: 15,
                                        endIndent: 15,
                                      )
                                    ],
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    showBottomMenu
                        ? AnimatedOpacity(
                            duration: Duration(milliseconds: 200),
                            opacity: showBottomMenu ? 1 : 0,
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                              child: Container(
                                  color: Colors.black.withOpacity(0.2)),
                            ),
                          )
                        : SizedBox(height: 0),
                    AnimatedPositioned(
                        curve: Curves.easeInOut,
                        duration: Duration(milliseconds: 200),
                        left: 0,
                        bottom: showBottomMenu ? -60 : -(height - 160),
                        child: DrawerMenu(
                            notifyParent: removeSelectedFood,
                            open: showBottomMenu,
                            selectedFoods: selectedFoods))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

const String saveMeal = r'''
mutation SaveUserFoodMapping($foodInfoRequest: [FoodInfoRequest]) {
    saveUserFoodMapping(foodInfoRequest: $foodInfoRequest) {
        protein
        fat
        carbohydrate
        calorie
    }
}
''';
