import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trauxit_test/logic/nav_bar_screens/home_layout/home_layout_state.dart';
import 'package:trauxit_test/presentation/nav_bar_screens/screens/cart/cart_screen.dart';
import 'package:trauxit_test/presentation/nav_bar_screens/screens/counter/counter_screen.dart';
import 'package:trauxit_test/presentation/nav_bar_screens/screens/home/home_screen.dart';
import 'package:trauxit_test/presentation/nav_bar_screens/screens/search/search_screen.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutInitial());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(HomeBottomNavState());
  }

  List<Widget> pages = [
    const HomeScreen(),
    const SearchScreen(),
    const CounterScreen(),
    const CartScreen(),
  ];
}
