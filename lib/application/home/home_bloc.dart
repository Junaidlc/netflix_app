import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/hot_and_new_respository/hot_and_new_service.dart';
import 'package:netflix/domain/hot_and_new_respository/model/hot_and_new_respository.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewService _homeService;
  HomeBloc(this._homeService) : super(HomeState.initial()) {
    /*
    



     on event get homescreen data 
     
     */
    on<GetHomeScreenData>((event, emit) async {
      // send loading to UI

      emit(state.copyWith(isLoading: true, hasError: false));
      // get Data
      final _movieResult = await _homeService.getHotAndNewMovieData();
      final _tvResult = await _homeService.getHotAndNewTvData();

      // transform Data
      final _state1 = _movieResult.fold(
        (MainFailure failure) {
          return  HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trandingMovieList: [],
            tenseDramaMovieList: [],
            southIndiaMovieList: [],
            trandingTVList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNewRespository resp) {
          final pastYear = resp.results;
          final tranding = resp.results;
          final dramas = resp.results;
          final southIndian = resp.results;
          pastYear.shuffle();
          tranding.shuffle();
          dramas.shuffle();
          southIndian.shuffle();

          return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: pastYear,
            trandingMovieList: tranding,
            tenseDramaMovieList: dramas,
            southIndiaMovieList: southIndian,
            trandingTVList: state.trandingTVList,
            isLoading: false,
            hasError: false,
          );
        },
      );

      emit(_state1);

      final _state2 = _tvResult.fold(
        (MainFailure failure) {
          return  HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trandingMovieList: [],
            tenseDramaMovieList: [],
            southIndiaMovieList: [],
            trandingTVList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNewRespository resp) {
          final top10List = resp.results;
          return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: state.pastYearMovieList,
            trandingMovieList: top10List,
            tenseDramaMovieList: state.tenseDramaMovieList,
            southIndiaMovieList: state.southIndiaMovieList,
            trandingTVList: top10List,
            isLoading: false,
            hasError: false,
          );
        },
      );

      // send to UI
      emit(_state2);
    });
  }
}
