import 'package:elice_pa/cubit/course_cubit.dart';
import 'package:elice_pa/cubit/free_course_cubit.dart';
import 'package:elice_pa/cubit/recommend_course_cubit.dart';
import 'package:elice_pa/repository/course_repository.dart';
import 'package:elice_pa/screen/main/home_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RecommendCourseCubit>(
          create: (_) => RecommendCourseCubit(CourseRepository()),
        ),
        BlocProvider<FreeCourseCubit>(
          create: (_) => FreeCourseCubit(CourseRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: "Roboto",
          primarySwatch: Colors.blue,
        ),
        home: const HomeRouter(),
      ),
    );
  }
}
