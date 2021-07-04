import 'package:bloctobloc/business_logic/bloc/add_bloc/add_bloc.dart';
import 'package:bloctobloc/business_logic/bloc/main_bloc/main_bloc.dart';
import 'package:bloctobloc/presentation/screens/add_page.dart';
import 'package:bloctobloc/presentation/screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddBloc>(
          create: (context) => AddBloc(),
        ),
        BlocProvider<MainBloc>(
          create: (context) => MainBloc(),
        ),
      ],
      child: MaterialApp(
        routes: {
          '/': (_) => MainPage(),
          '/AddPage': (_) => AddPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
