import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class InformationEvent extends Equatable {
  const InformationEvent();

  @override
  List<Object> get props => [];
}

class InformationStarted extends InformationEvent {}

// 질문저장
class InformationOne extends InformationEvent {
  final int currentWeight;

  InformationOne({@required this.currentWeight});
  @override
  List<Object> get props => [currentWeight];
}
class InformationTwo extends InformationEvent {
  final int goalWeight;

  InformationTwo({@required this.goalWeight});
  @override
  List<Object> get props => [goalWeight];
}
class InformationThree extends InformationEvent {
  final int gender;

  InformationThree({@required this.gender});
  @override
  List<Object> get props => [gender];
}
class InformationFour extends InformationEvent {
  final int height;

  InformationFour({@required this.height});
  @override
  List<Object> get props => [height];
}
class InformationFive extends InformationEvent {
  final String dateOfBirth;

  InformationFive({@required this.dateOfBirth});
  @override
  List<Object> get props => [dateOfBirth];
}
class InformationSix extends InformationEvent {
  final int activity;

  InformationSix({@required this.activity});
  @override
  List<Object> get props => [activity];
}

class SaveInformation extends InformationEvent {
  SaveInformation();
  @override
  List<Object> get props => [];
}

/*
{
  "userInfoRequest": {
    "currentWeight":50,
    "goalWeight": 70,
    "height":180,
    "dateOfBirth": "1990-12-21",
    "gender": 1,
    "goal": 1,
    "activity": 1
  }
}

  final String id_;
  final int currentWeight_;
  final int dailyIntakeCalorie_;
  final String dateOfBirth_;
  final int goalWeight_;
  final int height_;
  final int gender_; // id, gender
  final int goal_; // id, goal
  final int activity_; // id, activity
  
 */