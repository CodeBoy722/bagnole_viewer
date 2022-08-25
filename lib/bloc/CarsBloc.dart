
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import '../models/CarModel.dart';
import '../resources/Repository.dart';

@injectable
@singleton
class CarsBloc {
  /// cars provider initialization with by dependency injection
  final Repository _repo;
  Stream<List<CarModel>> get allCars => _repo.fetchAllMyCars();

  CarsBloc(this._repo);

  dispose() {
    /// implement bloc dispose logic here
  }

}
