import 'package:flutter/material.dart';
import 'package:dreambody/theme/colors.dart';

class NutrientsCounter extends StatefulWidget {
  NutrientsCounter({
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
    final double percent = (widget.current / widget.goal);

    return Container(
      child: Column(
        children: <Widget>[
          Text(
            '${widget.current} / ${widget.goal}g',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          SizedBox(height: 5),
          Container(
            width: 100,
            height: 10,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Theme.of(context).primaryColor,
                inactiveTrackColor: Colors.white,
                trackHeight: 3.0,
                thumbColor: Theme.of(context).primaryColor,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
                overlayColor: Colors.purple.withAlpha(32),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 14.0),
              ),
              child: Slider(value: percent, onChanged: (value) {}),
            ),
          ),
          SizedBox(height: 5),
          Text(
            '${widget.title}',
            style: TextStyle(color: customColor.primaryDarkColor),
          ),
        ],
      ),
    );
  }
}
