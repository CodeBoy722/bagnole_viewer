

import 'package:inject/inject.dart';
import '../main.dart';
import 'bloc_module.dart';
import 'bloc_injector.inject.dart' as g;

@Injector([BlocModule])
abstract class BlocInjector{

  @provide
  MyApp get app;

  static final create = g.BlocInjector$Injector.create;
}