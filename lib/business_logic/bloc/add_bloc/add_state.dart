import 'package:bloctobloc/business_logic/models/text_field.dart';
import 'package:equatable/equatable.dart';


class AddState extends Equatable {
  const AddState(
      {
      required this.desc,
      required this.fstatus,
      });
  final TextField desc;
  final bool fstatus;

  AddState copyWith(
      {
      TextField? desc,
      bool? fstatus,
      }) {
    return AddState(
      desc: desc ?? this.desc,
      fstatus: fstatus?? this.fstatus,
    );
  }

  @override
  List<Object> get props => [desc, ];
}
