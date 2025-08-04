import 'package:app/navigation_service.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final injector = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => injector.init();

final NavigationService navigationServiceDI = injector<NavigationService>();
