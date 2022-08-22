
import '../models/CarModel.dart';
import 'CarsDataProvider.dart';

class Repository{

  final CarsDataProvider carsProvider;

  Repository(this.carsProvider);

  Future<List<CarModel>> fetchAllMyCars() => carsProvider.fetchMyCars();

}