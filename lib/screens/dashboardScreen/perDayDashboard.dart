import 'package:dreambody/blocs/intakeInfo/BlocProvider.dart';
import 'package:dreambody/blocs/intakeInfo/intakeInfoBloc.dart';
import 'package:dreambody/blocs/intakeInfo/states.dart';
import 'package:flutter/material.dart';
import './nutrientsCounter.dart';
import './calorieCounter.dart';

class PerDayDashboard extends StatefulWidget {
  const PerDayDashboard({Key key}) : super(key: key);

  @override
  _PerDayDashboardState createState() => _PerDayDashboardState();
}

class _PerDayDashboardState extends State<PerDayDashboard> {

  @override
  Widget build(BuildContext context) {
    final IntakeInfoBloc bloc = BlocProvider3.of(context);
    final IntakeInfoBloc intakeInfoBloc = BlocProvider3.of<IntakeInfoBloc>(context);
    final String intakeInfo = '{"goalIntakeCalorie": 5000, "currentIntakeCalorie": 20}';
    IntakeInfo initIntakeInfo = IntakeInfo();
    bloc.UpdateIntakeInfo(intakeInfo);

    return StreamBuilder(
      initialData: initIntakeInfo,
      stream: intakeInfoBloc.intakeInfoStream,
      builder: (BuildContext context, snapshot) {
        if(snapshot.data == initIntakeInfo){
          bloc.UpdateIntakeInfo(intakeInfo); // refresh
        }
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