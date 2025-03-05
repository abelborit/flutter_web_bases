import 'package:fluro/fluro.dart';
import 'package:flutter_web_bases/ui/views/counter_provider_view.dart';
import 'package:flutter_web_bases/ui/views/counter_view.dart';
import 'package:flutter_web_bases/ui/views/view_404.dart';

/* Handlers: lo que se ejecutará cuando la aplicación ingrese a la ruta. Ya NO se manejará de forma privada con el "_" ni de forma static porque ahora ya no está dentro de una clase y queremos exportarlo en el archivo de configuración de las rutas */
final Handler counterHandler = Handler(
  /* en este caso estamos regresando una view porque solo queremos cambiar una parte de la página y no toda la página en sí cuando se esté cambiando de rutas */
  /* aquí como se hace uso del "buildContext" entonces se puede tener el contexto como por ejemplo saber si un usuario está autenticado, si tiene accesos, si viene el argumento que se espera y dependendiendo de eso o esos factores entonces mostrar de forma condicional una view u otra */
  handlerFunc: (buildContext, params) {
    /* como se está manejando el mismo elemento o widget para ambas ruta, es decir, se está usando el mismo handler de "_counterHandler" tanto para "/stateful" como para "/stateful/:baseCounter" entonces el colocar directamente -- params["baseCounter"][0] -- nos dirá que puede ser null, y para eso se coloca el "?" para que si el parámetro viene entonces recién tome la primera posición */
    // print(params);
    // print(params["baseCounter"]);
    // print(params["baseCounter"]?[0]);

    /* es necesario colocar el return para que retorne una vista porque sino entonces no aparece */
    return CounterView(baseCounter: params["baseCounter"]?[0] ?? "5");
  },
);

final Handler counterProviderHandler = Handler(
  handlerFunc: (buildContext, params) {
    // print(params);
    // print(params["q"]);
    // print(params["q"]?[0]);

    return CounterProviderView(baseCounter: params["q"]?[0] ?? "5");
  },
);

final Handler dashboardUserHandler = Handler(
  handlerFunc: (buildContext, params) {
    // print(params);
    // print(params["q"]);
    // print(params["q"]?[0]);

    /* aquí se está colocando el "View404" solo para colocar alguna vista */
    return View404();
  },
);

final Handler pageNotFound = Handler(
  handlerFunc: (buildContext, params) => View404(),
);
