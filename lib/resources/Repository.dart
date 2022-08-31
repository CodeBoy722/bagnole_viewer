
import 'package:injectable/injectable.dart';
import '../di/injection.dart';
import '../models/CarModel.dart';
import 'CarsDataProvider.dart';

@Environment(Env.prod)
@injectable
@singleton
class Repository {
  final FirestoreCarsService carsProvider;

  Repository(this.carsProvider);

  Stream<List<CarModel>> fetchAllMyCars() => carsProvider.fetchCarsStream;

  Stream<List<CarModel>> fetchCarsByYear(String queryYear) => carsProvider.fetchCarsStreamByYear(queryYear);

  Stream<List<CarModel>> fetchCarsByMark(String queryMark) => carsProvider.fetchCarsStreamByMark(queryMark);

  @disposeMethod
  dispose() {
    /// implement bloc dispose logic here
  }

}