


import 'package:injectable/injectable.dart';
import '../di/injection.dart';
import '../models/CarModel.dart';
import '../resources/RepositoryTest.dart';

@Environment(Env.test)
@injectable
@singleton
class CarsBlocTest {
  /// cars provider initialization with by dependency injection
  final RepositoryTest _repo;
  Stream<List<CarModel>> get allCars => _repo.fetchAllMyCars();

  CarsBlocTest(this._repo);

  dispose() {
    /// implement bloc dispose logic here
  }

}
