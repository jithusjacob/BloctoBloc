import 'package:equatable/equatable.dart';

abstract class AddEvent extends Equatable {
  const AddEvent();
  @override
  List<Object> get props => [];
}


class AddInitial extends AddEvent {
  const AddInitial();
}
class AddDescChange extends AddEvent {
  const AddDescChange(this.desc);
  final String desc;
  @override
  List<Object> get props => [desc];
}


class AddSubmit extends AddEvent {
  const AddSubmit();
}

