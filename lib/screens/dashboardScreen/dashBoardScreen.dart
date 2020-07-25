import 'package:flutter/material.dart';

import 'package:dreambody/widgets/gradientPageLayout.dart';
import './perDayDashboard.dart';
import 'package:dreambody/theme/colors.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientPageLayout(
        child: Column(children: [
      PerDayDashboard(),
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/water');
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(100),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Image.asset(
                  'static/images/waterDrop.png',
                  height: 30,
                  width: 30,
                ),
              ),
              Text(
                '오늘 마신 물을 기록해보세요!',
                style: TextStyle(
                    color: customColor.primaryDarkColor,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      )
    ]));
  }
}
