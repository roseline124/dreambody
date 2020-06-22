import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class WaterDashboard extends StatelessWidget {
  const WaterDashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Opacity(
      opacity: 0.3,
      child: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: LiquidCircularProgressIndicator(
            value: 0.25,
            valueColor: AlwaysStoppedAnimation(Colors.pink),
            backgroundColor: Colors.white,
            borderColor: Colors.red,
            borderWidth: 1.0,
            direction: Axis.vertical,
          ),
        ),
      ),
    ));
  }
}
