
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../di/injection.config.dart';

final getIt = GetIt.instance;
@injectableInit
void configureInjection(String environment) =>
    $initGetIt(getIt,environment: environment);

abstract class Env{
  static const dev = "development";
  static const prod = "production";
  static const test = "unit_tests";
}
