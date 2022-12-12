import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class CountCubit extends Cubit<int> {
  CountCubit() : super(0);
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
  void reset() => emit(0);
}
