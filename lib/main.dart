import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shared/bloc/home_cubit/home_bloc.dart';
import 'package:flutter_shared/ui/home/home_screen.dart';
import 'bloc/filter_dialog_cubit/filter_dialog_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create:((context) => HomeBloc(context: context))
        ),
        BlocProvider(
            create:((context) => FilterDialogCubit())
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

