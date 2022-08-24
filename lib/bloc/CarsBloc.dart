
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



// List<CarModel> composeList() {
//   List<CarModel> newCars = [];
//   Stream<List<CarModel>> carsStream = _repo.fetchAllMyCars();
//   carsStream.listen((List<CarModel> cars) {
//     for(CarModel car in cars){
//       newCars.add(car);
//     }
//   });
//   return newCars;
// }