import 'package:bloctobloc/business_logic/bloc/main_bloc/main_event.dart';
import 'package:bloctobloc/business_logic/bloc/main_bloc/main_state.dart';
import 'package:bloctobloc/business_logic/models/item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc()
      : super(
          MainState(
            items: <Item>[],
          ),
        );

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    if (event is MainAddItem) {
      yield _mapAddItemToState(event, state);
    }
    // } else if (event is AddCategoryChange) {
    //   yield _mapCategoryChangedToState(event, state);
    // } else if (event is AddDescChange) {
    //   yield _mapDescChangedToState(event, state);
    // } else if (event is AddAmountChange) {
    //   yield _mapAmountChangedToState(event, state);
    // } else if (event is AddSubmit) {
    //   yield _mapSubmittedToState(event, state);
    // }
  }

  MainState _mapAddItemToState(MainAddItem event, MainState state) {
    print("Add item");
    final Item item = event.item;
    final List<Item> items = state.items.toList()..add(item);
    return state.copyWith(
      items: items,
    );
  }
}
