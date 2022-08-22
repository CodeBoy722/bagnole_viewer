
import 'package:inject/inject.dart';
import '../models/CarModel.dart';
import 'CarsDataProvider.dart';

class Repository{

  final CarsDataProvider carsProvider;

  @provide
  Repository(this.carsProvider);

  Future<List<CarModel>> fetchAllMyCars() => carsProvider.fetchMyCars();

}