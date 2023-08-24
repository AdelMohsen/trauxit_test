import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:trauxit_test/logic/nav_bar_screens/search/search_cubit.dart';
import 'package:trauxit_test/logic/nav_bar_screens/search/search_state.dart';
import 'package:trauxit_test/models/products/product_data.dart';
import 'package:trauxit_test/presentation/nav_bar_screens/screens/search/widgets/form_field_widget.dart';
import 'package:trauxit_test/utilities/constance/empty_widget.dart';
import 'package:trauxit_test/utilities/shared_widgets/product_card_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = SearchCubit.get(context);
    return CustomScrollView(
      slivers: [
        const SearchFormFieldWidget(),
        BlocBuilder<SearchCubit, SearchState>(
          buildWhen: (previous, current) =>
              current is GetSearchDataLoading ||
              current is GetSearchDataSuccess ||
              current is GetSearchDataError,
          builder: (context, state) {
            return Conditional.single(
              context: context,
              conditionBuilder: (context) => cubit.searchModel != null,
              widgetBuilder: (context) {
                if (cubit.searchModel!.isNotEmpty) {
                  return SliverPadding(
                    padding: const EdgeInsets.all(12),
                    sliver: SliverGrid.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: .7,
                      ),
                      itemCount: cubit.searchModel!.length,
                      itemBuilder: (context, index) {
                        ProductData product = cubit.searchModel![index];
                        return ProductCardWidget(
                          imageUrl: product.thumbnail,
                          newPrice: product.price.toString(),
                          title: product.title,
                          description: product.description,
                          discountPercent:
                              product.discountPercentage.toString(),
                          productId: product.id.toString(),
                          width: 160,
                        );
                      },
                    ),
                  );
                } else {
                  return const SliverToBoxAdapter(child: EmptyWidget());
                }
              },
              fallbackBuilder: (context) =>
                  const SliverToBoxAdapter(child: EmptyWidget()),
            );
          },
        )
      ],
    );
  }
}
