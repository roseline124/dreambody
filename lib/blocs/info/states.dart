import 'package:equatable/equatable.dart';

abstract class InformationState extends Equatable {
  const InformationState();

  @override
  List<Object> get props => [];
}

class InformationInitial extends InformationState {}

class InformationSuccess extends InformationState {}

class InformationInProgress extends InformationState {}

class InformationFailure extends InformationState {}