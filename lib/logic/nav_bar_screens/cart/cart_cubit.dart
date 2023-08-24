import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trauxit_test/logic/nav_bar_screens/cart/cart_state.dart';
import 'package:trauxit_test/models/cart/cart_model.dart';
import 'package:trauxit_test/utilities/constance/dialogs.dart';
import 'package:trauxit_test/utilities/constance/strings.dart';
import 'package:trauxit_test/utilities/network/shared_pref.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);

  CartModel cartModel = CartModel([]);
  Future<CartModel> getLocalCart() async {
    emit(GetLocalCartStorageLoading());
    var myLocalCart = await CacheHelper.readData(key: 'cart') ?? nullValueName;
    cartModel = myLocalCart != nullValueName
        ? CartModel.fromJson(jsonDecode(myLocalCart))
        : CartModel([]);
    emit(GetLocalCartStorageSuccess());
    return cartModel;
  }

  addToCart({
    required String productId,
    required BuildContext context,
    required String quantity,
    required String image,
    required String finalPrice,
    required String title,
    required String piecePrice,
    String? notes,
    bool? navigateToCartScreen,
  }) async {
    emit(SaveToLocalStorageLoading());
    getLocalCart().then((value) {
      cartModel.cartData = value.cartData;
    });

    if (cartModel.cartData.isNotEmpty) {
      bool isAlreadyExist = false;
      cartModel.cartData.forEachIndexed((index, x) {
        if (cartModel.cartData[index].productId == productId) {
          int newVal = int.parse(cartModel.cartData[index].quatity.toString()) +
              int.parse(quantity.toString());
          cartModel.cartData[index].quatity = newVal;
          isAlreadyExist = true;
        }
      });

      if (!isAlreadyExist) {
        cartModel.cartData.add(
          CartData(productId, quantity, image, finalPrice, title, piecePrice),
        );
      }

      saveFunction(
          context: context, navigateToCartScreen: navigateToCartScreen);
      emit(SaveToLocalStorageSuccess());

      return Dialogs.showSnackBar(
        bodyMessage: 'Update cart successfully',
        status: 1,
        context: context,
      );
    } else {
      cartModel.cartData.add(
          CartData(productId, quantity, image, finalPrice, title, piecePrice));
      saveFunction(
          context: context, navigateToCartScreen: navigateToCartScreen);
      emit(SaveToLocalStorageSuccess());
      return Dialogs.showSnackBar(
        bodyMessage: "Add To Cart Success",
        status: 1,
        context: context,
      );
    }
  }

  saveFunction({
    required BuildContext context,
    bool? navigateToCartScreen = false,
  }) async {
    var myList = [];
    for (var element in cartModel.cartData) {
      myList.add(
        CartData.fromMap(
          productId: element.productId,
          quatity: element.quatity,
          image: element.imageUrl,
          finalPrice: element.finalPrice,
          title: element.title,
          notes: element.notes,
          piecePrice: element.piecePrice,
        ),
      );
    }

    Map<String, dynamic> cartMap = CartModel.fromMap(
      cartData: myList,
    );
    var x = jsonEncode(cartMap);
    await CacheHelper.saveData(key: 'cart', value: x).then((value) async {
      await getLocalCart();
    });
  }

  increaseProductQuantityInCart(int index, BuildContext context) {
    int newVal = int.parse(cartModel.cartData[index].quatity.toString());
    newVal++;
    cartModel.cartData[index].quatity = newVal.toString();
    String newPrice =
        (newVal * double.parse(cartModel.cartData[index].piecePrice.toString()))
            .toString();
    cartModel.cartData[index].finalPrice = newPrice;
    saveFunction(context: context);
  }

  decreaseProductQuantityInCart(int index, BuildContext context) {
    int newVal = int.parse(cartModel.cartData[index].quatity.toString());
    if (newVal > 1) {
      newVal--;
      cartModel.cartData[index].quatity = newVal.toString();
      String newPrice = (newVal *
              double.parse(cartModel.cartData[index].piecePrice.toString()))
          .toString();
      cartModel.cartData[index].finalPrice = newPrice;
      saveFunction(context: context);
    }
  }

  removeElementFormCart(
    int index,
    BuildContext context,
  ) {
    if (index >= 0 && index < cartModel.cartData.length) {
      cartModel.cartData.removeAt(index);
      saveFunction(context: context);
      return Dialogs.showSnackBar(
        bodyMessage: "Deleted Successfully",
        status: 1,
        context: context,
      );
    }
  }

  removeAllCart(BuildContext context) {
    cartModel.cartData = [];
    cartModel.cartData.clear();
    saveFunction(context: context, navigateToCartScreen: false);
  }
}
