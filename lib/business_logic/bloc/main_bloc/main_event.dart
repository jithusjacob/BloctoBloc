import 'package:bloctobloc/business_logic/models/item.dart';
import 'package:equatable/equatable.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
  @override
  List<Object> get props => [];
}

class MainAddItem extends MainEvent {
  const MainAddItem(this.item);
  final Item item;
  @override
  List<Object> get props => [item];
}
