import 'package:elice_pa/config/color.dart';
import 'package:elice_pa/cubit/free_course_cubit.dart';
import 'package:elice_pa/cubit/recommend_course_cubit.dart';
import 'package:elice_pa/dto/course_dto.dart';
import 'package:elice_pa/screen/detail_course_screen.dart';
import 'package:elice_pa/screen/main/home_screen.dart';
import 'package:elice_pa/util/converter.dart';
import 'package:elice_pa/widget/course_tile/course_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeRouter extends StatefulWidget {
  const HomeRouter({Key? key}) : super(key: key);

  @override
  State<HomeRouter> createState() => _HomeRouterState();
}

class _HomeRouterState extends State<HomeRouter> {
  //Data
  int _selectedIndex = 0;

  //String
  final String _bottomNaviHome = "Home";
  final String _bottomNaviQR = "QR";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeScreen(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      elevation: 0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.account_balance_outlined),
          label: _bottomNaviHome,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.camera_alt_outlined),
          label: _bottomNaviQR,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: selectedMainColor,
      onTap: _onTapNavigatorItem,
    );
  }

  void _onTapNavigatorItem(int i) {
    setState(() {
      _selectedIndex = i;
    });
  }
}