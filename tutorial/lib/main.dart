import 'package:flutter/material.dart';
import 'package:tutorial/observer/count_observer.dart';
import 'package:tutorial/screen/temp_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/count_cubit.dart';

void main() {
  Bloc.observer = CountObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => CountCubit(),
        child: TempView(),
      ),
    );
  }
}
