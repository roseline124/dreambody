import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class WaterDashboard extends StatefulWidget {
  const WaterDashboard({Key key}) : super(key: key);

  @override
  _WaterDashboardState createState() => _WaterDashboardState();
}

class _WaterDashboardState extends State<WaterDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.purple, Colors.blue])),
      child: Stack(
        children: [
          // WaterIndicator(progress: 0.3, progressColor: Colors.amber),
          WaterIndicator(progress: 0.35, progressColor: Colors.amber[100]),
        ],
      ),
    ));
  }
}

class WaterIndicator extends StatelessWidget {
  const WaterIndicator({
    this.progressColor,
    this.borderColor = Colors.transparent,
    this.progress = 0.5,
    this.width = 200,
    this.height = 200,
    this.opacity = 0.3,
  });

  final double width;
  final double height;
  final double opacity;
  final double progress;
  final Color borderColor;
  final Color progressColor;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Center(
        child: SizedBox(
          width: width,
          height: height,
          child: LiquidCircularProgressIndicator(
            value: progress,
            valueColor: AlwaysStoppedAnimation(progressColor),
            backgroundColor: Colors.transparent,
            borderColor: borderColor,
            borderWidth: 1.0,
            direction: Axis.vertical,
          ),
        ),
      ),
    );
  }
}
