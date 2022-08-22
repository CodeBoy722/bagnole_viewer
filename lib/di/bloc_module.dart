

import 'package:inject/inject.dart';
import '../resources/CarsDataProvider.dart';
import '../resources/Repository.dart';

class BlocModule{

  @provide
  @singleton
  CarsDataProvider carsDataProvider() => CarsDataProvider();

  @provide
  @singleton
  Repository repository(CarsDataProvider carsDataProvider) => Repository(carsDataProvider);

}