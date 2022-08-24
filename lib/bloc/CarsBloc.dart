
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import '../models/CarModel.dart';
import '../resources/Repository.dart';

@injectable
@singleton
class CarsBloc {
  /// the is a bloc class, it the equivilent of a viewModel in MVVM architecture
 /* CarsBloc._privateConstructor();
  static final carsBlocInstance = CarsBloc._privateConstructor();*/

  /// cars provider initialization with by dependency injection
  final Repository _repo;
  late final _carsFetcher = PublishSubject<List<CarModel>>();
  Stream<List<CarModel>> get allCars => _repo.fetchAllMyCars();

  CarsBloc(this._repo);

  fetAllMyCars() async {
    List<CarModel> cars =  composeList();
    _carsFetcher.sink.add(cars);
  }

  List<CarModel> composeList() {
    List<CarModel> newCars = [];
    Stream<List<CarModel>> carsStream = _repo.fetchAllMyCars();
    carsStream.listen((List<CarModel> cars) {
      for(CarModel car in cars){
        newCars.add(car);
      }
    });
    return newCars;
  }

  /// disposing of bloc while activity complete
  dispose() {
    _carsFetcher.close();
  }

}