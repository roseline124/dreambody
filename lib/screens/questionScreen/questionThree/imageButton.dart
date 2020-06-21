import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  const ImageButton(
      {@required this.src,
      this.label,
      this.width = 70,
      this.height = 70,
      this.isSelected});

  final String label;
  final String src;
  final double width;
  final double height;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    Color checkColor;
    if (isSelected) {
      checkColor = Theme.of(context).accentColor;
    } else {
      checkColor = Colors.transparent;
    }
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Icon(Icons.check, color: checkColor)),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            border:
                Border.all(width: 2.0, color: Theme.of(context).primaryColor),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.asset(src, height: height, width: width),
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          label,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
