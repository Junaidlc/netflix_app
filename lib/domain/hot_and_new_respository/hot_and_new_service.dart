

import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/hot_and_new_respository/model/hot_and_new_respository.dart';

abstract class HotAndNewService{
  Future<Either<MainFailure,HotAndNewRespository>> getHotAndNewMovieData();
  Future<Either<MainFailure,HotAndNewRespository>> getHotAndNewTvData();
}