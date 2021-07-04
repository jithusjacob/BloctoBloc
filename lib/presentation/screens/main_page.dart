import 'package:bloctobloc/business_logic/bloc/main_bloc/main_bloc.dart';
import 'package:bloctobloc/business_logic/bloc/main_bloc/main_state.dart';
import 'package:bloctobloc/presentation/widgets/category_item_card.dart';
import 'package:bloctobloc/presentation/widgets/summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Summary(),
              BlocBuilder<MainBloc, MainState>(
                  buildWhen: (previous, current) =>
                      previous.items != current.items,
                  builder: (context, state) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: state.items.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CategoryItemCard(state.items[index]);
                          }),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
