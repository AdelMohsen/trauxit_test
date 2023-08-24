import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:trauxit_test/logic/nav_bar_screens/home_layout/home_layout_cubit.dart';
import 'package:trauxit_test/logic/nav_bar_screens/home_layout/home_layout_state.dart';
import 'package:trauxit_test/utilities/shared_widgets/appbar_widget.dart';
import 'package:trauxit_test/utilities/shared_widgets/nav_bar_floation_widget.dart';
import 'package:trauxit_test/utilities/constance/colors.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = HomeLayoutCubit.get(context);
    return BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
      buildWhen: (previous, current) => current is HomeBottomNavState,
      builder: (context, state) => KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: CustomeAppBarWidget(
                backgroundColor: SharedColor.white,
              ),
            ),
            floatingActionButton:
                !isKeyboardVisible ? NavBarFloationWidaget(cubit) : null,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: AnimatedBottomNavigationBar(
              backgroundColor: SharedColor.black,
              borderColor: SharedColor.transparent,
              hideAnimationCurve: Curves.ease,
              notchMargin: 0,
              splashRadius: 0,
              blurEffect: true,
              icons: const [
                CupertinoIcons.home,
                CupertinoIcons.search,
                CupertinoIcons.heart,
                CupertinoIcons.cart,
              ],
              activeIndex: cubit.currentIndex,
              elevation: 5,
              gapLocation: GapLocation.center,
              notchSmoothness: NotchSmoothness.defaultEdge,
              leftCornerRadius: 20,
              rightCornerRadius: 20,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              activeColor: SharedColor.primaryColor,
              inactiveColor: SharedColor.white,
              splashColor: SharedColor.primaryColor,
              splashSpeedInMilliseconds: 500,
              iconSize: 22,
            ),
            body: cubit.pages[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
