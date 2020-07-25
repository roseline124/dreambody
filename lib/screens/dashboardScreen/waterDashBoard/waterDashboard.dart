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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(children: <Widget>[
                  BackButton(
                      color: Colors.white.withAlpha(200),
                      onPressed: () => Navigator.of(context).pop())
                ]),
              ),
              Container(
                  child: Column(
                children: [
                  Text(
                    '꿀꺽꿀꺽! 캬아~',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  Text(
                    '물을 마시고 얼마나 마셨는지 기록해보세요',
                    style: TextStyle(color: Colors.white70, fontSize: 16.0),
                  )
                ],
              )),
              Container(
                child: WaterWave(value: glassesOfWater),
                padding: EdgeInsets.symmetric(vertical: 70),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  children: <Widget>[
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70),
                      ),
                      onPressed: () {
                        if (!(glassesOfWater >= 20)) {
                          setState(() {
                            glassesOfWater += 1;
                          });
                        }
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(70),
                        ),
                        onPressed: () {
                          if (!(glassesOfWater <= 0)) {
                            setState(() {
                              glassesOfWater -= 1;
                            });
                          }
                        },
                        child: Icon(Icons.remove, color: Colors.white)),
                    MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(70),
                        ),
                        onPressed: () {
                          setState(() {
                            glassesOfWater = 0;
                          });
                        },
                        child: Icon(Icons.refresh, color: Colors.white)),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
