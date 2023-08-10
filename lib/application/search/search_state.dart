part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required List<SearchResultData> searchResultList,
    required List<Downloads> idleList,
    required bool isLoarding,
    required bool isError,
  }) = _SearchState;

  factory SearchState.initial() => const SearchState(
        searchResultList: [],
        idleList: [],
        isLoarding: false,
        isError: false,
      );
}
