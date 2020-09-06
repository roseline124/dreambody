import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:calendar_strip/calendar_strip.dart';

import 'package:dreambody/widgets/gradientPageLayout.dart';
import 'package:dreambody/theme/colors.dart';
import 'package:dreambody/i18n/kr.dart';

// screens
import 'summaryBoard/perDayDashboard.dart';
import 'mealBoard/mealDashBoard.dart';
import 'waterDashBoard/waterDashboard.dart';

// query
import 'package:graphql_flutter/graphql_flutter.dart';
import 'mealBoard/types.dart';

final getDateString = (DateTime date) => DateFormat('yyyy-MM-dd').format(date);

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({this.token});
  final String token;

  @override
  DashBoardScreenState createState() => DashBoardScreenState();
}

class DashBoardScreenState extends State<DashBoardScreen> {
  DateTime startDate = DateTime.now().subtract(Duration(days: 30));
  DateTime endDate = DateTime.now().add(Duration(days: 30));
  DateTime _selectedDate = DateTime.now();

  onSelect(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  _monthNameWidget(String monthName) {
    return Container(
      child: Text(
        monthName.replaceAllMapped(
            RegExp(
                r'January|February|March|April|May|June|July|August|September|October|November|December'),
            (Match match) => (monthNameMap[match.group(0)])),
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: Colors.white70,
        ),
      ),
      padding: EdgeInsets.only(top: 16, bottom: 4),
    );
  }

  dateTileBuilder(
      date, selectedDate, rowIndex, dayName, isDateMarked, isDateOutOfRange) {
    bool isSelectedDate = date.compareTo(selectedDate) == 0;
    Color fontColor = isDateOutOfRange ? Colors.white24 : Colors.white70;
    TextStyle normalStyle =
        TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: fontColor);
    TextStyle selectedStyle = TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w800,
        color: customColor.primaryDarkColor);
    List<Widget> _children = [
      Text(dayNameMap[dayName],
          style: TextStyle(
              fontSize: 14.5,
              color:
                  !isSelectedDate ? fontColor : customColor.primaryDarkColor)),
      Text(date.day.toString(),
          style: !isSelectedDate ? normalStyle : selectedStyle),
    ];

    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 5),
      decoration: BoxDecoration(
        color: !isSelectedDate
            ? Colors.transparent
            : customColor.primaryLightColor,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Column(
        children: _children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String _selectedDateString = getDateString(_selectedDate);

    return Query(
        options: QueryOptions(documentNode: gql(getSummary), variables: {
          "requestSummary": {"registrationDate": _selectedDateString},
          "waterInfoRequest": {"registrationDate": _selectedDateString},
        }),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.hasException) {
            return null;
          }

          if (result.loading) {
            return Scaffold(body: Text('Loading'));
          }

          FoodSum goal = FoodSum.fromJSON(result.data['summary']['goal']);
          FoodSum intake = FoodSum.fromJSON(result.data['summary']['intake']);

          int totalWater = result.data['waterInfo'] != null
              ? result.data['waterInfo']['amountWater']
              : 0;

          return GradientPageLayout(
              child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: SizedBox(
                  height: 120,
                  child: CalendarStrip(
                    startDate: startDate,
                    endDate: endDate,
                    onDateSelected: onSelect,
                    selectedDate: _selectedDate,
                    dateTileBuilder: dateTileBuilder,
                    monthNameWidget: _monthNameWidget,
                    containerDecoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              PerDayDashboard(
                intakes: intake,
                goals: goal,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WaterDashboard(
                                refetchWater: refetch,
                                selectedDate: _selectedDateString,
                                currentWater: totalWater)));
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(100),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Image.asset(
                            'static/images/waterDrop.png',
                            height: 30,
                            width: 30,
                          ),
                        ),
                        Text(
                          (totalWater == 0)
                              ? '오늘 마신 물을 기록해보세요!'
                              : '오늘 마신 물의 양은 ${totalWater}ml입니다.',
                          style: TextStyle(
                              color: customColor.primaryDarkColor,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              MealDashBoard(
                token: widget.token,
                dashboard: this,
                refetchSummary: refetch,
                selectedDate: _selectedDateString,
              )
            ]),
          ));
        });
  }
}

const String getSummary = r'''
query Summary($requestSummary: RequestSummary, $waterInfoRequest: WaterInfoRequest) {
    summary(requestSummary: $requestSummary) {
        goal {
            calorie
            carbohydrate
            protein
            fat
        }
        intake {
            calorie
            carbohydrate
            protein
            fat
        }
    }

    waterInfo(waterInfoRequest: $waterInfoRequest) {
        amountWater
    }
}
''';
