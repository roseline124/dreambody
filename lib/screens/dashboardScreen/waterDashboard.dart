import 'package:flutter/material.dart';
import './waterWave.dart';

class WaterDashboard extends StatefulWidget {
  const WaterDashboard({Key key}) : super(key: key);

  @override
  _WaterDashboardState createState() => _WaterDashboardState();
}

class _WaterDashboardState extends State<WaterDashboard> {
  int glassesOfWater = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.purple, Colors.blue])),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: Column(
                    children: [
                      Text(
                        'Drink More Water',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      Text(
                        'Have a glass of water and Record it',
                        style: TextStyle(color: Colors.white70, fontSize: 16.0),
                      )
                    ],
                  )),
              Container(
                child: WaterWave(value: glassesOfWater),
                padding: EdgeInsets.symmetric(vertical: 70),
              ),
              MaterialButton(
                  onPressed: () {
                    if (!(glassesOfWater >= 20)) {
                      setState(() {
                        glassesOfWater += 1;
                      });
                    }
                  },
                  child: Text('+')),
              MaterialButton(
                  onPressed: () {
                    if (!(glassesOfWater <= 0)) {
                      setState(() {
                        glassesOfWater -= 1;
                      });
                    }
                  },
                  child: Text('-')),
              MaterialButton(
                  onPressed: () {
                    setState(() {
                      glassesOfWater = 0;
                    });
                  },
                  child: Text('reset')),
            ]),
      ),
    );
  }
}
