abstract class SearchState {}

class SearchInitial extends SearchState {}

class AddSearchText extends SearchState {}

class GetSearchDataLoading extends SearchState {}

class GetSearchDataSuccess extends SearchState {}

class GetSearchDataError extends SearchState {}
