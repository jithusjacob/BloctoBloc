import 'package:bloctobloc/business_logic/bloc/add_bloc/add_event.dart';
import 'package:bloctobloc/business_logic/bloc/add_bloc/add_state.dart';
import 'package:bloctobloc/business_logic/models/text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBloc extends Bloc<AddEvent, AddState> {
  AddBloc()
      : super(AddState(
          desc: TextField(text: '', status: false),
          fstatus: true,
        ));

  @override
  Stream<AddState> mapEventToState(AddEvent event) async* {
    if (event is AddDescChange) {
      yield _mapDescChangedToState(event, state);
    } else if (event is AddSubmit) {
      yield _mapSubmittedToState(event, state);
    }
  }

  AddState _mapDescChangedToState(AddDescChange event, AddState state) {
    final String desc = event.desc;
    print(desc);
    return state.copyWith(
      desc: TextField(text: desc, status: desc.isNotEmpty),
    );
  }

  AddState _mapSubmittedToState(AddSubmit event, AddState state) {
    if (state.desc.status) {
      print("Succsess");

      return AddState(
        desc: TextField(text: '', status: false),
        fstatus: true,
      );
    } else {
      print("failure");
      return state.copyWith(
        fstatus: false,
      );
    }
  }
}
