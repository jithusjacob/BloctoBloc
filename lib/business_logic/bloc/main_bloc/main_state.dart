import 'package:bloctobloc/business_logic/models/item.dart';
import 'package:equatable/equatable.dart';

class MainState extends Equatable {
  const MainState({
    required this.items,
  });
  final List<Item> items;

  MainState copyWith({
    List<Item>? items,
  }) {
    return MainState(
      items: items ?? this.items,
    );
  }

  @override
  List<Object> get props => [items];
}
