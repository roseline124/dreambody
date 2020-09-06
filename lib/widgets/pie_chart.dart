import 'package:flutter/material.dart';
import 'dart:math';
import 'package:dreambody/theme/colors.dart';

class PieChart extends CustomPainter {
  PieChart({
    this.percentage,
    this.remain,
  });

  int percentage = 0;
  int remain = 0;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint() // 화면에 그릴 때 쓸 Paint를 정의합니다.
      ..color = Colors.white
      ..strokeWidth = 10.0 // 선의 길이를 정합니다.
      ..style =
          PaintingStyle.stroke // 선의 스타일을 정합니다. stroke면 외곽선만 그리고, fill이면 다 채웁니다.
      ..strokeCap =
          StrokeCap.round; // stroke의 스타일을 정합니다. round를 고르면 stroke의 끝이 둥글게 됩니다.

    double radius = min(
        size.width / 2 - paint.strokeWidth / 2,
        size.height / 2 -
            paint.strokeWidth / 2); // 원의 반지름을 구함. 선의 굵기에 영향을 받지 않게 보정함.
    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);

    double arcAngle = 2 * pi * (percentage / 100);

    paint..color = customColor.primaryColor;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, paint);

    //size는 원의 중앙 정렬
    drawText(canvas, Size(150.0, 130.0), "$remain", 1.0, Colors.white);
    drawText(canvas, Size(150.0, 190.0), "잔여 칼로리", 0.6,
        customColor.primaryDarkColor);
  }

  // 원의 중앙에 텍스트를 적음.
  void drawText(Canvas canvas, Size size, String text, double textScaleFactor,
      Color color) {
    double fontSize = getFontSize(size, text, textScaleFactor);

    TextSpan sp = TextSpan(
        style: TextStyle(
            fontSize: fontSize, fontWeight: FontWeight.bold, color: color),
        text: text); // TextSpan은 Text위젯과 거의 동일하다.
    TextPainter tp = TextPainter(text: sp, textDirection: TextDirection.ltr);

    tp.layout();
    double dx = size.width / 2 - tp.width / 2;
    double dy = size.height / 2 - tp.height / 2;
    Offset offset = Offset(dx, dy);
    tp.paint(canvas, offset);
  }

  double getFontSize(Size size, String text, double textScaleFactor) {
    if (text == null) return 0;
    return size.width / text.length * textScaleFactor;
  }

  @override
  bool shouldRepaint(PieChart old) {
    return old.percentage != percentage;
  }
}
