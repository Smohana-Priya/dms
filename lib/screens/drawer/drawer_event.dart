import 'package:flutter/cupertino.dart';

import '../../utils/base_equatable.dart';

abstract class DrawerEvent extends BaseEquatable {}

// ignore: must_be_immutable
class DrawerInitialEvent extends DrawerEvent {
  BuildContext? context;
  dynamic arguments;

  DrawerInitialEvent({this.context});
}
