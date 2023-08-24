import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trauxit_test/logic/nav_bar_screens/cart/cart_cubit.dart';
import 'package:trauxit_test/logic/nav_bar_screens/home_screen/home_cubit.dart';
import 'package:trauxit_test/logic/nav_bar_screens/home_screen/home_state.dart';
import 'package:trauxit_test/models/products/product_data.dart';
import 'package:trauxit_test/utilities/constance/colors.dart';
import 'package:trauxit_test/utilities/constance/custome_text.dart';
import 'package:trauxit_test/utilities/constance/empty_widget.dart';
import 'package:trauxit_test/utilities/constance/loading.dart';
import 'package:trauxit_test/utilities/shared_widgets/product_card_widget.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

class HomeMostPopularWidget extends StatelessWidget {
  const HomeMostPopularWidget(this.cubit, {super.key});
  final HomeCubit cubit;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 10, start: 10),
            child: CustomeHeadlineText(
              'The possibilities are endless. Shop now!',
              color: SharedColor.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 220,
            child: BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) =>
                  current is GetProductLoading ||
                  current is GetProductSuccess ||
                  current is GetProductError,
              builder: (context, state) {
                return Conditional.single(
                  context: context,
                  conditionBuilder: (context) => cubit.products != null,
                  widgetBuilder: (context) {
                    if (cubit.products!.isEmpty) {
                      return const EmptyWidget();
                    } else {
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsetsDirectional.only(
                            top: 10, start: 10),
                        itemBuilder: (context, index) {
                          final ProductData product = cubit.products![index];
                          return ProductCardWidget(
                            imageUrl: product.thumbnail,
                            newPrice: product.price.toString(),
                            title: product.title,
                            description: product.description,
                            discountPercent:
                                product.discountPercentage.toString(),
                            productId: product.id.toString(),
                            width: 160,
                            onTap: () => CartCubit.get(context).addToCart(
                              productId: product.id.toString(),
                              context: context,
                              quantity: '1',
                              image: product.thumbnail,
                              finalPrice: product.price.toString(),
                              title: product.title,
                              piecePrice: product.price.toString(),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 10),
                        itemCount: cubit.products!.length,
                      );
                    }
                  },
                  fallbackBuilder: (context) =>
                      const Center(child: AdaptiveCircularProgress()),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
