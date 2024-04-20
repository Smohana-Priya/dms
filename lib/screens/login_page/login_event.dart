import 'package:flutter/material.dart';

import '../../utils/base_equatable.dart';

abstract class LoginEvent extends BaseEquatable {}

class LoginInitialEvent extends LoginEvent {
 BuildContext? context;
  dynamic arguments;
  
  LoginInitialEvent({this.context});

}



