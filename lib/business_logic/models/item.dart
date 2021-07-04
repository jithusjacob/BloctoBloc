import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String desc;

  const Item(
      {
      required this.desc,
      });
  @override
  List<Object> get props => [desc];
}
