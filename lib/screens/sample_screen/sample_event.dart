
import 'package:flutter/cupertino.dart';

import '../../utils/base_equatable.dart';

abstract class OTPEvent extends BaseEquatable {}

class OTPInitialEvent extends OTPEvent {
  BuildContext? context;
  dynamic arguments;

  OTPInitialEvent({this.context});

}
