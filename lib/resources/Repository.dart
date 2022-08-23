
import 'package:injectable/injectable.dart';

import '../models/CarModel.dart';
import 'CarsDataProvider.dart';

@injectable
@singleton
class Repository{
  final CarsDataProvider carsProvider;
  Repository(this.carsProvider);

  Future<List<CarModel>> fetchAllMyCars() => carsProvider.fetchMyCars();

}