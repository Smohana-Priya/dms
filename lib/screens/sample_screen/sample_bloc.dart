
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
import 'sample_event.dart';

class OTPBloc extends Bloc<OTPEvent, BaseState> {
  OTPBloc() : super(InitialState());


  @override
  Stream<BaseState> mapEventToState(
      OTPEvent event,
      ) async* {
    if (event is OTPInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    }
  }
}