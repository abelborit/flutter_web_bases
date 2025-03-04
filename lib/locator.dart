/* este archivo nos servirá para mantener todos nuestros singletons de manera centralizada. No son singletons como tal, o se podría decir que sí son pero a la vez no lo son, es decir, porque si son una única instancia pero serán trabajados como cualquier otra clase en el proyecto */

import 'package:flutter_web_bases/services/navegation_service.dart';
import 'package:get_it/get_it.dart';

/* en cualquier parte de la aplicación se puede hacer referencia a este "locator" y aquí se tendrá acceso al NavegationService. De esta forma es muy parecido a como si se trabajara con "provider" solo que de esta manera nosotros vamos a tener cierto control especial, menos código y también es más facil de probar */
GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavegationService());
}
