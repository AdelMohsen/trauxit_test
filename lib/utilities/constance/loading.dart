import 'package:flutter/material.dart';
import 'package:trauxit_test/utilities/constance/colors.dart';

class AdaptiveCircularProgress extends StatelessWidget {
  const AdaptiveCircularProgress({
    super.key,
    this.backgroundColor,
  });
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator.adaptive(
      backgroundColor: SharedColor.white,
      valueColor: AlwaysStoppedAnimation<Color>(SharedColor.secondryColor),
    );
  }
}
