import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trauxit_test/logic/nav_bar_screens/search/search_cubit.dart';
import 'package:trauxit_test/logic/nav_bar_screens/search/search_state.dart';
import 'package:trauxit_test/utilities/constance/debouncer_widget.dart';
import 'package:trauxit_test/utilities/constance/default_form_field.dart';

class SearchFormFieldWidget extends StatefulWidget {
  const SearchFormFieldWidget({super.key});

  @override
  State<SearchFormFieldWidget> createState() => _SearchFormFieldWidgetState();
}

class _SearchFormFieldWidgetState extends State<SearchFormFieldWidget> {
  final _debouncer = Debouncer(milliseconds: 750);
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    final cubit = SearchCubit.get(context);
    super.initState();
    searchController.clear();
    if (cubit.searchModel != null) {
      cubit.searchModel!.clear();
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchCubit, SearchState>(
      listenWhen: (previous, current) =>
          current is GetSearchDataLoading ||
          current is GetSearchDataSuccess ||
          current is GetSearchDataError,
      listener: (context, state) async {
        if (state is GetSearchDataError) {
          await Future.delayed(const Duration(seconds: 3)).then((value) =>
              SearchCubit.get(context)
                  .getSearchData(context, searchController.text));
        }
      },
      child: SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              DefaultFormField(
                titleText: 'Search',
                hintText: 'What you are looking for?',
                needValidation: false,
                controller: searchController,
                onChanged: (value) {
                  _debouncer.run(() {
                    if (value.isEmpty) {
                      SearchCubit.get(context).searchModel = [];
                      SearchCubit.get(context).searchModel = null;
                    } else {
                      SearchCubit.get(context).addSearchText();
                      SearchCubit.get(context).getSearchData(context, value);
                    }
                  });
                },
              ),
              BlocBuilder<SearchCubit, SearchState>(
                buildWhen: (previous, current) =>
                    current is GetSearchDataLoading ||
                    current is GetSearchDataSuccess ||
                    current is GetSearchDataError,
                builder: (context, state) {
                  return state is GetSearchDataLoading
                      ? const LinearProgressIndicator()
                      : const SizedBox();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
