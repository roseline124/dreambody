import 'package:dreambody/bloc/BlocProvider.dart';
import 'package:flutter/material.dart';
import './nutrientsCounter.dart';
import './calorieCounter.dart';

import 'package:dreambody/bloc/models/intake.dart';
import 'package:dreambody/bloc/IntakeInfoBloc.dart';

class PerDayDashboard extends StatefulWidget {
  const PerDayDashboard({Key key}) : super(key: key);

  @override
  _PerDayDashboardState createState() => _PerDayDashboardState();
}

class _PerDayDashboardState extends State<PerDayDashboard> {
  @override
  Widget build(BuildContext context) {
    final IntakeInfoBloc bloc = BlocProvider.of(context);
    final IntakeInfoBloc intakeInfoBloc = BlocProvider.of<IntakeInfoBloc>(context);
    return StreamBuilder(
      initialData: IntakeInfo(goalIntakeCalorie_: 100),
      stream: intakeInfoBloc.intakeInfoStream,
      builder: (BuildContext context, snapshot) {
        bloc.UpdateIntakeInfo('{"goalIntakeCalorie": 40, "currentIntakeCalorie": 20}');
        return Scaffold(
          body: Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Container(
                child: Column(
                  children: <Widget>[
                    CalorieCounter(current: snapshot.data.currentIntakeCalorie, goal: snapshot.data.goalIntakeCalorie, consume: snapshot.data.consumeCalorie),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NutrientsCounter(title: '탄수화물', current: snapshot.data.currentCarbohydrate, goal: snapshot.data.goalCarbohydrate),
                        NutrientsCounter(title: '단백질', current: snapshot.data.currentProtein, goal: snapshot.data.goalProtein),
                        NutrientsCounter(title: '지방', current: snapshot.data.currentFat, goal: snapshot.data.goalFat),
                      ]),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                width: 370.0,
                height: 300.0,
              ),
            ),
          ),
        );
      }
    );
  }
}
