import 'package:flutter/material.dart';

class TypeButton extends StatelessWidget {
  const TypeButton(
      {@required this.label,
      this.isSelected,
      this.onPressed,});

  final void Function() onPressed;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: MaterialButton(
            minWidth: 700,
            child: Text(
              label,
              style: TextStyle(
                  color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
            ),
            color: isSelected? Colors.white60 : Colors.white30,
            height: 50,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
