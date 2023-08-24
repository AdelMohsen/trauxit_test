import 'package:flutter/material.dart';
import 'package:trauxit_test/logic/nav_bar_screens/home_layout/home_layout_cubit.dart';
import 'package:trauxit_test/utilities/constance/colors.dart';
import 'package:trauxit_test/utilities/constance/images_strings.dart';

class NavBarFloationWidaget extends StatelessWidget {
  const NavBarFloationWidaget(this.cubit, {super.key});
  final HomeLayoutCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, 17),
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: SharedColor.primaryColor,
        splashColor: SharedColor.transparent,
        hoverColor: SharedColor.transparent,
        focusColor: SharedColor.transparent,
        foregroundColor: SharedColor.transparent,
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset(cubit.currentIndex == 4
              ? ImagePath.largeIcon
              : ImagePath.largeIcon),
        ),
      ),
    );
  }
}
