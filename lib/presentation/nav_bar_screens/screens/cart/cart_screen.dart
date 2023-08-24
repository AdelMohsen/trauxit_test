import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trauxit_test/logic/nav_bar_screens/cart/cart_cubit.dart';
import 'package:trauxit_test/logic/nav_bar_screens/cart/cart_state.dart';
import 'package:trauxit_test/presentation/nav_bar_screens/screens/cart/widgets/total_price_widget.dart';

import 'widgets/cart_products_list_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    CartCubit.get(context).getLocalCart();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = CartCubit.get(context);

    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) =>
          current is GetLocalCartStorageLoading ||
          current is GetLocalCartStorageSuccess ||
          current is SaveToLocalStorageLoading ||
          current is SaveToLocalStorageSuccess,
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
                    child: CartProductsListWidget(cubit))),
            CartTotalPriceWidget(cubit),
          ],
        );
      },
    );
  }
}
