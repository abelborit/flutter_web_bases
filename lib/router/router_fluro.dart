import 'package:fluro/fluro.dart';
import 'package:flutter_web_bases/router/route_handlers.dart';

class RouterWithFluro {
  /* no es necesario colocar "new FluroRouter()" sino solo "FluroRouter()" */
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    router.define(
      "/",
      handler: counterHandler,
      transitionType: TransitionType.fadeIn,
      transitionDuration: Duration(milliseconds: 100),
    );

    /* tanto para "/stateful" y "/stateful/:baseCounter" se está usando el mismo handler "counterHandler" y se puede usar así o sino crear handlers diferentes para cada ruta ya que al final de cuentas se puede decir que son rutas diferentes */
    router.define(
      "/stateful",
      handler: counterHandler,
      transitionType: TransitionType.fadeIn,
      transitionDuration: Duration(milliseconds: 100),
    );

    router.define(
      "/stateful/:baseCounter",
      handler: counterHandler,
      transitionType: TransitionType.fadeIn,
      transitionDuration: Duration(milliseconds: 100),
    );

    /* para este caso que se manejará con query parameters sí se tiene que manejar con el mismo handler ya que esos query parameters son opcionales */
    router.define(
      "/provider",
      handler: counterProviderHandler,
      transitionType: TransitionType.fadeIn,
      transitionDuration: Duration(milliseconds: 100),
    );

    router.define(
      "/dashboard/users/:userdId/:roleId",
      handler: dashboardUserHandler,
      transitionType: TransitionType.fadeIn,
      transitionDuration: Duration(milliseconds: 100),
    );

    router.notFoundHandler = pageNotFound;
  }
}
