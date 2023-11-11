part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String stateId,
    required List<HotAndNewData> pastYearMovieList,
    required List<HotAndNewData> trandingMovieList,
    required List<HotAndNewData> tenseDramaMovieList,
    required List<HotAndNewData> southIndiaMovieList,
    required List<HotAndNewData> trandingTVList,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;

  factory HomeState.initial() => const HomeState(
        stateId: '0',
        pastYearMovieList: [],
        trandingMovieList: [],
        tenseDramaMovieList: [],
        southIndiaMovieList: [],
        trandingTVList: [],
        isLoading: false,
        hasError: false,
      );
}
