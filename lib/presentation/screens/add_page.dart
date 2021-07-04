import 'package:bloctobloc/business_logic/bloc/add_bloc/add_bloc.dart';
import 'package:bloctobloc/business_logic/bloc/add_bloc/add_event.dart';
import 'package:bloctobloc/business_logic/bloc/add_bloc/add_state.dart';
import 'package:bloctobloc/business_logic/bloc/main_bloc/main_bloc.dart';
import 'package:bloctobloc/business_logic/bloc/main_bloc/main_event.dart';
import 'package:bloctobloc/business_logic/models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 100;
//    var h = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () =>
                          Navigator.popUntil(context, ModalRoute.withName('/')),
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.blueGrey,
                      ),
                    ),
                    SizedBox(
                      width: w * 30,
                    ),
                    Text(
                      "Add Details",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: w * 5,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ),
              _DescInput(),
              _AddButton(),
            ],
          ),
        ),
      ),
    );
  }
}


class _DescInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddBloc, AddState>(
        buildWhen: (previous, current) =>
            previous.desc.text != current.desc.text,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "Description",
                errorText: state.desc.status ? null : 'Can not be empty',
              ),
              onChanged: (desc) {
                context.read<AddBloc>().add(AddDescChange(desc));
              },
            ),
          );
        });
  }
}

class _AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddBloc, AddState>(
      builder: (context, state) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blueGrey,
            onPrimary: Colors.white,
          ),
          onPressed: () {
            context.read<AddBloc>().add(AddSubmit());
            context.read<MainBloc>().add(
                  MainAddItem(
                    Item(
                      desc: state.desc.text,
                    ),
                  ),
                );
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
          child: Text('Add'),
        );
      },
    );
  }
}
