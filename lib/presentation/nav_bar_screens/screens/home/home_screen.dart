import 'package:flutter/material.dart';
import 'package:trauxit_test/logic/nav_bar_screens/cart/cart_cubit.dart';
import 'package:trauxit_test/logic/nav_bar_screens/home_screen/home_cubit.dart';
import 'package:trauxit_test/presentation/nav_bar_screens/screens/home/widgets/banner_widget.dart';
import 'package:trauxit_test/presentation/nav_bar_screens/screens/home/widgets/best_offer_widget.dart';
import 'package:trauxit_test/presentation/nav_bar_screens/screens/home/widgets/most_popular_widget.dart';
import 'package:trauxit_test/utilities/constance/colors.dart';
import 'package:trauxit_test/utilities/constance/custome_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    if (HomeCubit.get(context).products == null) {
      HomeCubit.get(context).getHomeData(context);
    }
    CartCubit.get(context).getLocalCart();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.get(context);
    return CustomScrollView(
      slivers: [
        //-----------------------BANNER---------------------------------------//
        const HomeBannerWidget(),
        //--------------------MOST POPULAR------------------------------------//
        HomeMostPopularWidget(cubit),
        //------------------------TITLE---------------------------------------//
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(top: 10, start: 10),
            child: CustomeHeadlineText(
              'Traxuit Aare HERE.',
              color: SharedColor.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        //---------------------BEST OFFER-------------------------------------//
        HomeBestOfferWidget(cubit)
      ],
    );
  }
}
