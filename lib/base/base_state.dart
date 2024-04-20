import '../utils/base_equatable.dart';

abstract class BaseState extends BaseEquatable {}

class InitialState extends BaseState {}

class LoadingState extends BaseState {}

class ValidationErrorState extends BaseState {}

class UnderConstructionState extends BaseState {}

class WidgetLoading extends BaseState {
  String? widgetLoadingText;

  WidgetLoading({this.widgetLoadingText});
}

class SuccessState extends BaseState {
  final dynamic successResponse;

  SuccessState({this.successResponse});

  @override
  List<Object> get props => [successResponse];
}

class FailureState extends BaseState {
  final dynamic errorMessage;

  FailureState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
