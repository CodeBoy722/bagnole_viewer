
import 'package:injectable/injectable.dart';
import '../di/injection.dart';
import '../models/CarModel.dart';
import 'CarsDataProviderTest.dart';

@Environment(Env.test)
@injectable
@singleton
class RepositoryTest{
  final CarsDataProviderTest carsProvider;

  RepositoryTest(this.carsProvider);

  Stream<List<CarModel>> fetchAllMyCars() => carsProvider.fetchCarsStream;

  @disposeMethod
  dispose() {
    /// implement bloc dispose logic here
  }

}