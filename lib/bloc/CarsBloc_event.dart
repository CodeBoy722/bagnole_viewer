

import 'package:equatable/equatable.dart';

abstract class CarsEvent extends Equatable{
  const CarsEvent();

  @override
  List<Object> get props => [];
}

class GetCars extends CarsEvent {}


class GetCarsByYear extends CarsEvent{
  const GetCarsByYear({
    required this.queryYear,
  });

  final String queryYear;

  @override
  List<Object> get props => [queryYear];
}


class GetCarsByMark extends CarsEvent{
  const GetCarsByMark({
    required this.queryMark,
  });

  final String queryMark;

  @override
  List<Object> get props => [queryMark];
}

