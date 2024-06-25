import 'package:dms_dealers/screens/drawer/drawer_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';

class DrawerBloc extends Bloc<DrawerEvent, BaseState> {
  DrawerBloc() : super(InitialState());

  @override
  Stream<BaseState> mapEventToState(
    DrawerEvent event,
  ) async* {
    if (event is DrawerInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    }
  }
}
