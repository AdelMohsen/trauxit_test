import 'package:flutter/material.dart';
import 'package:trauxit_test/utilities/constance/images_strings.dart';

class HomeBannerWidget extends StatelessWidget {
  const HomeBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Image.asset(
        ImagePath.bannerImage,
        width: double.infinity,
      ),
    );
  }
}
