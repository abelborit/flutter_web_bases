import 'package:flutter/cupertino.dart';
import 'package:flutter_web_bases/ui/pages/counter_page.dart';
import 'package:flutter_web_bases/ui/pages/counter_provider_page.dart';
import 'package:flutter_web_bases/ui/pages/page_404.dart';

/* para saber si se está en la web -> no usaremos todo el package, solo usaremos -- kIsWeb -- */
import 'package:flutter/foundation.dart' show kIsWeb;

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
        return _fadeRoute(CounterPage(), "/stateful");

      case "/provider":
        return _fadeRoute(CounterProviderPage(), "/provider");

      default:
        return _fadeRoute(Page404(), "/page-not-found-404");
    }
  }

  static PageRoute _fadeRoute(Widget child, String routeName) {
    return PageRouteBuilder(
      settings: RouteSettings(name: routeName),

      /* aquí no se hará uso de lo que tiene el "pageBuilder", es decir, no se hará uso de "BuildContext, Animation<double>, Animation<double>" por eso se coloca como "_, __, ___". El child será el widget que se quiere renderizar */
      pageBuilder: (buildContext, animation, animationSecond) => child,

      transitionDuration: Duration(milliseconds: 100),

      /* este "transitionsBuilder" es quien se encarga de realizar el efecto, velocidad y duración de la transición, en este caso será un efecto de Fade */
      transitionsBuilder:
          (buildContext, animation, animationSecond, widget) =>
              (kIsWeb)
                  ? FadeTransition(opacity: animation, child: child)
                  : CupertinoPageTransition(
                    primaryRouteAnimation: animation,
                    secondaryRouteAnimation: animationSecond,
                    linearTransition: true,
                    child: child,
                  ),

      /* si no se quiere colocar con una animación entonces se coloca directo el child o widget que se va a utilizar */
      // transitionsBuilder: (_, animation, __, ___) => child,
    );
  }
}
