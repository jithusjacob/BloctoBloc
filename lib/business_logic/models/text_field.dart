import 'package:equatable/equatable.dart';

class TextField extends Equatable {
  final String text;
  final bool status;

  const TextField({required this.text, required this.status});
  @override
  List<Object> get props => [text, status];
}
