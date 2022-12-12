import 'dart:async';

import 'package:flutter/material.dart';

class CountBloc {
  int _count;
  CountBloc() : _count = 0;

  final streamController = StreamController<int>()..add(0);

  Stream<int> get countStream => streamController.stream;
  void plus() {
    _count++;
    streamController.add(_count);
  }

  void minus() {
    _count--;
    streamController.add(_count);
  }

  void dispose() {
    streamController.close();
  }
}
