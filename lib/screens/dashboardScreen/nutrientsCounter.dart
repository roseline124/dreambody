import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class NutrientsCounter extends StatefulWidget {
  const NutrientsCounter({
    @required this.title,
    this.current,
    this.goal,
  });

  final String title;
  final int current;
  final int goal;

  @override
  _NutrientsCounterState createState() => _NutrientsCounterState();
}

class _NutrientsCounterState extends State<NutrientsCounter> {
  @override
  Widget build(BuildContext context) {
    final SfRangeValues percent = ((widget.current / widget.goal) * 100) as SfRangeValues;

    return Container(
      child: Column(
            children: <Widget>[
              Text('${widget.title}'),
              SizedBox(height: 5),
              SfRangeSlider(
                min: 0.0,
                max: 100.0,
                values: percent,
                interval: 20,
                showTicks: true,
                showLabels: true,
                showTooltip: true,
                minorTicksPerInterval: 1,
                onChanged: (SfRangeValues values){
                  setState(() {
                  });
                },
              ),
              SizedBox(height: 5),
              Text('${widget.current} / ${widget.goal}g'),
            ],
          ),
    );
  }
}
