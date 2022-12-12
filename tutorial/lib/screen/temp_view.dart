import 'package:flutter/material.dart';
import 'package:tutorial/bloc/count_bloc.dart';
import 'dart:async';

late final counter = CountBloc();

class TempView extends StatelessWidget {
  TempView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            CountView(),
            TextButton(onPressed: counter.plus, child: Text("더하기")),
            TextButton(onPressed: counter.minus, child: Text("빼기")),
          ],
        ),
      ),
    );
  }
}

class CountView extends StatelessWidget {
  const CountView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("123");
    return StreamBuilder<int>(
        stream: counter.countStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Text(snapshot.data.toString());
        });
  }
}
