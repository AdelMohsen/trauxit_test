import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trauxit_test/logic/nav_bar_screens/home_screen/home_state.dart';
import 'package:trauxit_test/models/products/product_data.dart';
import 'package:trauxit_test/utilities/constance/dialogs.dart';
import 'package:trauxit_test/utilities/constance/utils.dart';
import 'package:trauxit_test/utilities/network/dio_helper.dart';
import 'package:trauxit_test/utilities/network/end_point.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<ProductData>? products;
  Future<void> getHomeData(BuildContext context) {
    emit(GetProductLoading());
    if (products != null) {
      products = null;
    }
    return DioHelper.getData(url: PRODUCTS).then((value) {
      if (value.statusCode == 200) {
        products = checkFromArray(value.data['products'])
            ? (value.data['products'] as List)
                .map((e) => ProductData.fromJson(e ?? ProductData.toJson()))
                .toList()
            : [];
      } else {
        Dialogs.showSnackBar(
          bodyMessage: value.data['message'].toString(),
          context: context,
        );
      }
      emit(GetProductSuccess());
    }).catchError((error) {
      if (kDebugMode) {
        Dialogs.showSnackBar(bodyMessage: error.toString(), context: context);
      }
      emit(GetProductError());
    });
  }
}
