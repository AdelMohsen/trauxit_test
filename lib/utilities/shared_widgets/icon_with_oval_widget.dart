import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:trauxit_test/utilities/constance/colors.dart';
import 'package:trauxit_test/utilities/constance/images_strings.dart';

class IconWithOvalWidget extends StatelessWidget {
  const IconWithOvalWidget({
    super.key,
    this.needOval = true,
  });
  final bool needOval;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: needOval ? OvalBottomBorderClipper() : null,
      child: Container(
        width: double.infinity,
        color: SharedColor.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImagePath.smallIcon,
              fit: BoxFit.contain,
            )
          ],
        )
            .animate()
            .fadeIn(duration: 900.ms, delay: 300.ms)
            .move(begin: const Offset(0, -200), curve: Curves.easeOutQuad),
      ),
    );
  }
}
