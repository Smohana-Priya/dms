import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
import 'login_event.dart';


class LoginBloc extends Bloc<LoginEvent, BaseState> {
  LoginBloc() : super(InitialState());

  
  @override
  Stream<BaseState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    } 
  }
}
