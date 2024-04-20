
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
import 'about_vechicle_event.dart';

class AboutVehicleBloc extends Bloc<AboutVehicleEvent, BaseState> {
  AboutVehicleBloc() : super(InitialState());


  @override
  Stream<BaseState> mapEventToState(
      AboutVehicleEvent event,
      ) async* {
    if (event is AboutVehicleInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    }
  }
}