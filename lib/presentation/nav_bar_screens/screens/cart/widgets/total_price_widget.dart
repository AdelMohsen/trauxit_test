import 'package:flutter/material.dart';
import 'package:trauxit_test/logic/nav_bar_screens/cart/cart_cubit.dart';
import 'package:trauxit_test/utilities/constance/colors.dart';
import 'package:trauxit_test/utilities/constance/custome_text.dart';

class CartTotalPriceWidget extends StatelessWidget {
  const CartTotalPriceWidget(this.cubit, {super.key});
  final CartCubit cubit;
  @override
  Widget build(BuildContext context) {
    String finalPrice = getFinalCartPrice(context);

    return cubit.cartModel.cartData.isNotEmpty
        ? Card(
            color: SharedColor.white,
            margin: const EdgeInsets.all(8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                      child: CustomeHeadlineText(
                    'Total Price',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )),
                  Expanded(
                      child: CustomeHeadlineText(
                    finalPrice,
                    color: SharedColor.black,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.end,
                    fontSize: 16,
                  )),
                ],
              ),
            ),
          )
        : const SizedBox();
  }
}

String getFinalCartPrice(BuildContext context) {
  double total = 0.0;
  String finalPrice = "0.0";

  if (CartCubit.get(context).cartModel.cartData.isNotEmpty) {
    for (var element in CartCubit.get(context).cartModel.cartData) {
      dynamic totalElementPrice = int.parse(element.quatity.toString()) *
          double.parse(element.piecePrice.toString());
      total += double.parse(totalElementPrice.toString());
      finalPrice = total.toString();
    }
  }

  return finalPrice;
}
