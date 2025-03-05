/* los providers son una clase que le va permitir a Flutter redibujarse o renderizarse de nuevo cuando se les notifique a los listeners. Eso es muy facil, por eso los providers son uno de los gestores de estado más utilizados, el más usado es el GetX (https://pub.dev/packages/get) */

import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 10;

  /* este sería mi constructor */
  CounterProvider(String baseCounter) {
    if (int.tryParse(baseCounter) != null) {
      _counter = int.parse(baseCounter);
    }
  }

  /* FORMA 1 */
  // get counter {
  //   return _counter;
  // }

  /* FORMA 2 */
  get counter => _counter;

  /* estos valores serán privados entonces por eso se tiene que exponer la funcionalidad o la forma para que _counter pueda cambiar */
  void increment() {
    _counter++;
    /* este "notifyListeners" va a notificar a todos los widgets que estén escuchando los cambios de este CounterProvider para que así se puedan a volver a re-renderizar con la información actualizada */
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}
