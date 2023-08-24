import 'package:flutter/material.dart';
import 'package:trauxit_test/logic/nav_bar_screens/cart/cart_cubit.dart';
import 'package:trauxit_test/models/cart/cart_model.dart';
import 'package:trauxit_test/utilities/constance/colors.dart';
import 'package:trauxit_test/utilities/constance/empty_widget.dart';
import 'package:trauxit_test/utilities/shared_widgets/cart_card_widget.dart';

class CartProductsListWidget extends StatelessWidget {
  const CartProductsListWidget(this.cubit, {Key? key}) : super(key: key);
  final CartCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: SharedColor.white,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
      child: cubit.cartModel.cartData.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: List.generate(
                  cubit.cartModel.cartData.length,
                  (index) {
                    CartData cartData = cubit.cartModel.cartData[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: CartCardWidget(
                        image: cartData.imageUrl,
                        counter: cartData.quatity.toString(),
                        miunsOnPressed: () {
                          cubit.decreaseProductQuantityInCart(index, context);
                        },
                        plusOnPressed: () {
                          cubit.increaseProductQuantityInCart(index, context);
                        },
                        title: cartData.title,
                        subTitle: cartData.piecePrice,
                        removeOnpressed: () {
                          cubit.removeElementFormCart(index, context);
                        },
                        onTap: () {},
                      ),
                    );
                  },
                ),
              ),
            )
          : const EmptyWidget(),
    );
  }
}
