
import 'package:injectable/injectable.dart';
import '../di/injection.dart';
import '../models/CarModel.dart';
import 'CarsDataProvider.dart';

@Environment(Env.prod)
@injectable
@singleton
class Repository {
  final CarsDataProvider carsProvider;

  Repository(this.carsProvider);

  Stream<List<CarModel>> fetchAllMyCars() => carsProvider.fetchCarsStream;

  @disposeMethod
  dispose() {
    /// implement bloc dispose logic here
  }

}