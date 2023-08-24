import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trauxit_test/logic/nav_bar_screens/search/search_state.dart';
import 'package:trauxit_test/models/products/product_data.dart';
import 'package:trauxit_test/utilities/constance/dialogs.dart';
import 'package:trauxit_test/utilities/constance/utils.dart';
import 'package:trauxit_test/utilities/network/dio_helper.dart';
import 'package:trauxit_test/utilities/network/end_point.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);

  addSearchText() {
    emit(AddSearchText());
  }

  List<ProductData>? searchModel;
  Future<void> getSearchData(BuildContext context, String searchText) {
    emit(GetSearchDataLoading());
    return DioHelper.getData(
      url: SEARCH,
      queries: {"q": searchText},
    ).then((value) {
      if (value.statusCode == 200) {
        searchModel = checkFromArray(value.data['products'])
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
      emit(GetSearchDataSuccess());
    }).catchError((error) {
      if (kDebugMode) {
        Dialogs.showSnackBar(bodyMessage: error.toString(), context: context);
      }
      emit(GetSearchDataError());
    });
  }
}
