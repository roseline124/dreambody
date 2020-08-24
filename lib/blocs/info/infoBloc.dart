import 'package:dreambody/blocs/auth/authBloc.dart';
import 'package:dreambody/blocs/auth/authRepository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'events.dart';
import 'states.dart';
import 'infoRepository.dart';

class InformationBloc extends Bloc<InformationEvent, InformationState> {
  final InfoRepository infoRepository;
  final AuthRepository authRepository;
  final AuthenticationBloc authenticationBloc;

  InformationBloc({
    @required this.infoRepository,
    @required this.authRepository,
    @required this.authenticationBloc,
  })  : assert(infoRepository != null),
        assert(authRepository != null),
        assert(authenticationBloc != null),
        super(null);

  InformationState get initialState => InformationInitial();

  @override
  Stream<InformationState> mapEventToState(
    InformationEvent event,
  ) async* {
    if (event is InformationStarted) {
      final bool hasToken = authRepository.hasToken();

      // 토큰 유무
      if (hasToken) {
        yield InformationSuccess();
      } else {
        yield InformationFailure();
      }
    }

    // 저장 이벤트
    if (event is InformationOne) {
      yield InformationInProgress();
      infoRepository.saveCurrentWeight(currentWeight: event.currentWeight);
      yield InformationSuccess();
    }
    if (event is InformationTwo) {
      yield InformationInProgress();
      infoRepository.saveGoalWeight(goalWeight: event.goalWeight);
      yield InformationSuccess();
    }
    if (event is InformationThree) {
      yield InformationInProgress();
      infoRepository.saveGenderType(genderType: event.genderType);
      yield InformationSuccess();
    }
    if (event is InformationFour) {
      yield InformationInProgress();
      infoRepository.saveHeight(height: event.height);
      yield InformationSuccess();
    }
    if (event is InformationFive) {
      yield InformationInProgress();
      infoRepository.saveDateOfBirth(dateOfBirth: event.dateOfBirth);
      yield InformationSuccess();
    }
    if (event is InformationSix) {
      yield InformationInProgress();
      infoRepository.saveActivityType(activityType: event.activityType);
      yield InformationSuccess();
    }
    if (event is InformationType) {
      yield InformationInProgress();
      infoRepository.saveGoalType(goalType: event.goalType);
      yield InformationSuccess();
    }

    //mutation
    if (event is SaveInformation) {
      yield InformationInProgress();
      // 최신화
      yield InformationSuccess();
    }
  }
}
