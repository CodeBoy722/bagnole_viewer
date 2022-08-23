// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../bloc/CarsBloc.dart' as _i6;
import '../controllers/State_controller.dart' as _i5;
import '../resources/CarsDataProvider.dart' as _i3;
import '../resources/Repository.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.CarsDataProvider>(() => _i3.CarsDataProvider());
  gh.factory<_i4.Repository>(() => _i4.Repository(get<_i3.CarsDataProvider>()));
  gh.factory<_i5.StateController>(() => _i5.StateController());
  gh.factory<_i6.CarsBloc>(() => _i6.CarsBloc(get<_i4.Repository>()));
  return get;
}
