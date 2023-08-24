import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:trauxit_test/logic/nav_bar_screens/cart/cart_cubit.dart';
import 'package:trauxit_test/logic/nav_bar_screens/home_screen/home_cubit.dart';
import 'package:trauxit_test/logic/nav_bar_screens/home_screen/home_state.dart';
import 'package:trauxit_test/models/products/product_data.dart';
import 'package:trauxit_test/utilities/constance/empty_widget.dart';
import 'package:trauxit_test/utilities/constance/loading.dart';
import 'package:trauxit_test/utilities/shared_widgets/product_card_widget.dart';

class HomeBestOfferWidget extends StatelessWidget {
  const HomeBestOfferWidget(this.cubit, {super.key});
  final HomeCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
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
              return const SliverToBoxAdapter(child: EmptyWidget());
            } else {
              return SliverPadding(
                padding: const EdgeInsets.all(8),
                sliver: SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: .65,
                  ),
                  itemCount: cubit.products!.length,
                  itemBuilder: (context, index) {
                    ProductData product = cubit.products![index];
                    return ProductCardWidget(
                      imageUrl: product.thumbnail,
                      discountPercent: product.discountPercentage.toString(),
                      title: product.title,
                      description: product.description,
                      newPrice: product.price.toString(),
                      productId: product.id.toString(),
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
                ),
              );
            }
          },
          fallbackBuilder: (context) => const SliverToBoxAdapter(
              child: Center(child: AdaptiveCircularProgress())),
        );
      },
    );
  }
}
