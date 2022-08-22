
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';
import '../di/bloc_base.dart';
import '../models/CarModel.dart';
import '../resources/Repository.dart';

class CarsBloc extends BlocBase{
  final _repo;
  late final _carsFetcher;
  Stream<List<CarModel>> get allCars => _carsFetcher.stream;

  init(){
    _carsFetcher = PublishSubject<List<CarModel>>();
  }

  @provide
  CarsBloc(this._repo);

  fetAllMyCars() async {
    List<CarModel> cars = await _repo.fetchAllMyCars();
    _carsFetcher.sink.add(cars);
  }

  @override
  dispose() {
    _carsFetcher.close();
  }

}