import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/perference_helper.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationUnInitialized());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStarted) {
      bool minStatus = await PreferenceHelper.getLoginDetails();
      if (minStatus == true) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnAuthenticated();
      }
    }

    if (event is LoggedOut) {
      yield AuthenticationAuthenticated();
    }

  }
}

