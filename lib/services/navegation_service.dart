import 'package:flutter/cupertino.dart';

/* aquí lo estábamos trabajando de forma privada y como si fuera un singleton que se encuentra de manera global en la aplicación el cual sería dificil de probar si quisiéramos hacer pruebas sobre esta clase, entonces vamos a cambiar cómo lo estamos trabajando. Usaremos https://pub.dev/packages/get_it que es un paquete que sirve como para hacer inyección de dependencias que es algo muy parecido a como lo hace el paquete "provider" solo que lo hace sin ningún tipo de boilerplate o sin código extra, solo se inyecta y se usa, "get_it" no redibuja widgets, no es un gestor de estados propiamente a menos que nosotros lo utilizáramos para eso */
class NavegationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future navigationTo(String routeName) {
    /* se coloca el "!" porque nos dice que puede ser que sea nulo pero nosotros sabemos que siempre vendrá un valor ahí  */
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  void goBack(String routeName) {
    /* se coloca el "!" porque nos dice que puede ser que sea nulo pero nosotros sabemos que siempre vendrá un valor ahí  */
    return navigatorKey.currentState!.pop(); // para regresar a la ruta anterior
  }
}
