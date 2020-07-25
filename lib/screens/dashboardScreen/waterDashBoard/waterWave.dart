import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class WaterWave extends StatefulWidget {
  const WaterWave({this.value = 0});

  final int value;

  @override
  _WaterWaveState createState() => _WaterWaveState();
}

class _WaterWaveState extends State<WaterWave> {
  @override
  Widget build(BuildContext context) {
    final double drinkedWater = (100 - (5 * widget.value)) / 100;

    return Stack(
      children: [
        Center(
          child: Container(
            width: 200,
            height: 200,
            child: Center(
              child: Text('${widget.value * 100}ml',
                  style: TextStyle(fontSize: 30.0, color: Colors.white)),
            ),
          ),
        ),
        Center(
          child: Container(
            width: 200,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(255, 255, 255, 0.05)),
                child: Opacity(
                  opacity: 0.5,
                  child: WaveWidget(
                    config: CustomConfig(
                      colors: [
                        Colors.white12,
                        Colors.white24,
                        Colors.white38,
                        Colors.white24,
                      ],
                      durations: [35000, 19440, 10800, 6000],
                      heightPercentages: List.filled(4, drinkedWater),
                    ),
                    waveAmplitude: 0,
                    backgroundColor: Colors.transparent,
                    size: Size(
                      300,
                      300,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
