import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({@required this.onPressed, @required this.label});

  final void Function() onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        child: Text(
          label,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        color: Theme.of(context).primaryColor,
        height: 50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        onPressed: onPressed,
      ),
    );
  }
}
