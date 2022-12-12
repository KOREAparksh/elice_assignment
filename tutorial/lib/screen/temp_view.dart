import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial/cubit/count_cubit.dart';

class TempView extends StatefulWidget {
  TempView({Key? key}) : super(key: key);

  @override
  State<TempView> createState() => _TempViewState();
}

class _TempViewState extends State<TempView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            const CountView(),
            TextButton(
                onPressed: () => context.read<CountCubit>().increment(),
                child: Text("더하기")),
            TextButton(
                onPressed: () => context.read<CountCubit>().decrement(),
                child: Text("빼기")),
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
    return BlocBuilder<CountCubit, int>(
      builder: (context, count) => Text(count.toString()),
    );
  }
}
