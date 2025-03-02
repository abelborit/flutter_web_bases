import 'package:flutter/material.dart';
import 'package:flutter_web_bases/ui/pages/counter_page.dart';
import 'package:flutter_web_bases/ui/pages/counter_provider_page.dart';
import 'package:flutter_web_bases/ui/pages/page_404.dart';

/* este archivo es una clase que va a trabajar de la creación de todas las rutas de manera automática de la aplicación */

class RouteGenerator {
  /* como no queremos estar creando nuevas instancias, lo vamos a estar trabajando todo de maneja estática */
  static Route<dynamic> generateRoute(RouteSettings settings) {
    /* si no se está usando el BuildContext context se puede usar como "_" para hacer referencia a que no se está usando */
    /* por defecto siempre se estará generando el CounterPage, es decir, cualquier ruta pasará por este código y devolverá el CounterPage pero ahora, lo que se necesita es que basado en el nombre de la ruta se necesita generar una pantalla o mostrar algún componente, etc */
    // return MaterialPageRoute(builder: (BuildContext context) => CounterPage());
    // return MaterialPageRoute(builder: (_) => CounterPage());

    // print("***** RouteGenerator *****");
    // print(RouteSettings);
    // print(settings);

    /* en los settings.name están los nombres de las rutas que se quiere navegar */
    switch (settings.name) {
      case "/stateful":
        return MaterialPageRoute(builder: (_) => CounterPage());

      case "/provider":
        return MaterialPageRoute(builder: (_) => CounterProviderPage());

      default:
        return MaterialPageRoute(builder: (_) => Page404());
    }
  }
}
