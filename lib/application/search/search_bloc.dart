import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:netflix/domain/search/model/search_resp/search_resp.dart';
import 'package:netflix/domain/search/search_service.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsService;
  final SearchService _searchService;
  SearchBloc(this._downloadsService, this._searchService)
      : super(SearchState.initial()) {
/*
idle state
*/
    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(
          SearchState(
            searchResultList: [],
            idleList: state.idleList,
            isLoarding: false,
            isError: false,
          ),
        );
      }
      emit(
        const SearchState(
          searchResultList: [],
          idleList: [],
          isLoarding: true,
          isError: false,
        ),
      );
      // get trending
      final _result = await _downloadsService.getDownloadsImages();
      final _state = _result.fold(
        (MainFailure f) {
          return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoarding: false,
            isError: true,
          );
        },
        (List<Downloads> list) {
          return SearchState(
            searchResultList: [],
            idleList: list,
            isLoarding: false,
            isError: false,
          );
        },
      );
      // show to ui
      emit(_state);
    });
/*
search result state
*/
    on<SearchMovie>((event, emit) async {
      // call search movie api
      log("Searching for ${event.movieQuery}");
      emit(
        const SearchState(
          searchResultList: [],
          idleList: [],
          isLoarding: true,
          isError: false,
        ),
      );
      final _result =
          await _searchService.searchMovies(movieQuery: event.movieQuery);
      final _state = _result.fold(
        (MainFailure f) {
          return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoarding: false,
            isError: true,
          );
        },
        (SearchResp r) {
          return SearchState(
            searchResultList: r.results,
            idleList: [],
            isLoarding: false,
            isError: false,
          );
        },
      );
      // show to ui
      emit(_state);
    });
  }
}