import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/di/injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureInjection(String environment) async {
  getIt.init(environment: environment);
}
