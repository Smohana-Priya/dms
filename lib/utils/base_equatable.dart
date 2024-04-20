import 'package:equatable/equatable.dart';

class BaseEquatable extends Equatable {
  @override
  // ignore: hash_and_equals
  bool operator ==(Object other) => false;

  @override
  // ignore: always_specify_types
  List<Object> get props => [];
}
