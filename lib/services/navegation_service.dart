import 'package:flutter/cupertino.dart';

/* esto lo tendríamos que manejar como si fuera un singleton para que en todo lado de mi aplicación se tenga acceso a la misma instancia porque si se crea una nueva instancia de este "NavegationService" creará un nuevo "navigatorKey" entonces no va a poder apuntar al que nosotros queremos o establecimos */
/* estamos haciendo privada esta clase con el "_" al inicio del nombre */
class _NavegationService {
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

/* crear una nueva y única instancia de "_NavegationService" porque será el único objeto que se está exportando ya que como "_NavegationService" es privado entonces solo funciona en este archivo. NOTA: ahora no es necesario agregar el "new" como antes de "new _NavegationService()" */
final navegationService = _NavegationService();
