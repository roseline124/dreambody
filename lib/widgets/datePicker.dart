import 'package:dreambody/blocs/userInfo/BlocProvider.dart';
import 'package:dreambody/blocs/userInfo/states.dart';
import 'package:dreambody/blocs/userInfo/userInfoBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class DatePicker extends StatefulWidget {
  DatePicker({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DatePickerState();
}

final DateTime now = new DateTime.now();
const String MIN_DATETIME = '1920-01-01';
const String INIT_DATETIME = '1996-01-24';
const String DATE_FORMAT = 'yyyy년,MM월|d일';

class _DatePickerState extends State<DatePicker> {
  DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.parse(INIT_DATETIME);
  }

  @override
  Widget build(BuildContext context) {
    final UserInfoBloc bloc = BlocProvider2.of(context);
    final UserInfoBloc userInfoBloc = BlocProvider2.of<UserInfoBloc>(context);

    return StreamBuilder(
      initialData: UserInfo(),
      stream: userInfoBloc.userInfoStream,
      builder: (BuildContext context, snapshot) {
        return Container(
          decoration: BoxDecoration(color: Colors.transparent),
          padding: EdgeInsets.all(16.0),
          child: Container(
            margin: EdgeInsets.only(top: 24.0, bottom: 40.0),
            child: DatePickerWidget(
              minDateTime: DateTime.parse(MIN_DATETIME),
              maxDateTime: now,
              initialDateTime: DateTime.parse(INIT_DATETIME),
              dateFormat: DATE_FORMAT,
              pickerTheme: DateTimePickerTheme(
                backgroundColor: Colors.transparent,
                cancelTextStyle: TextStyle(color: Colors.transparent),
                confirmTextStyle: TextStyle(color: Colors.transparent),
                itemTextStyle: TextStyle(color: Theme.of(context).accentColor),
                pickerHeight: 300.0,
                titleHeight: 0.0,
                itemHeight: 30.0,
              ),
              onChange: (dateTime, selectedIndex) {
                setState(() {
                  _dateTime = dateTime;
                  bloc.UpdateUserInfo('{"dateOfBirth":"' + _dateTime.year.toString() + (_dateTime.month > 9? _dateTime.month.toString() : '0'+_dateTime.month.toString()) + (_dateTime.day > 9? _dateTime.day.toString() : '0'+_dateTime.day.toString()) + '"}');
                });
              },
            ),
          ),
        );
      }
    );
  }
}
