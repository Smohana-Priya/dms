
import 'package:flutter/cupertino.dart';

import '../../utils/base_equatable.dart';

abstract class AboutVehicleEvent extends BaseEquatable {}

class AboutVehicleInitialEvent extends AboutVehicleEvent {
  BuildContext? context;
  dynamic arguments;

  AboutVehicleInitialEvent({this.context});

}
