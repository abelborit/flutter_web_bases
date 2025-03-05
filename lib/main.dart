import 'package:flutter/material.dart';
import 'package:flutter_web_bases/locator.dart';
// import 'package:flutter_web_bases/router/route_generator.dart';
import 'package:flutter_web_bases/router/router_fluro.dart';
import 'package:flutter_web_bases/services/navegation_service.dart';
import 'package:flutter_web_bases/ui/layout/main_layout_page.dart';
// import 'package:flutter_web_bases/ui/pages/counter_page.dart';
// import 'package:flutter_web_bases/ui/pages/counter_provider_page.dart';

void main() {
  /* NOTA: importante es llamar a la configuración de rutas (la configuración que se utilice) antes de la construcción de la aplicación -- runApp(const MyApp()); -- porque obviamente es importante primero configurar las rutas antes de poder generar las rutas y utilizar estas rutas */

  /* una vez inicializado este "setupLocator" ya se tiene acceso a lo que sea que el "setupLocator" nos esté ofreciendo */
  setupLocator();

  /* manejador de rutas usando el paquete "Fluro" */
  RouterWithFluro.configureRoutes();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rutas Page App',
      /* las rutas aparecerán como -- /#stateful -- por eso se le coloca el / inicial para que ahora sea algo como -- /#/stateful -- */
      // initialRoute: 'stateful',
      // routes: {
      //   'stateful': (BuildContext context) => CounterPage()
      // },
      initialRoute: '/stateful', // esta ruta inicial es opcional colocarla
      // routes: {
      //   /* si no se está usando el BuildContext context se puede usar como "_" para hacer referencia a que no se está usando, pero en este caso lo vamos a dejar porque no nos causa mayor problema si se coloca o no */
      //   '/stateful': (BuildContext context) => CounterPage(),
      //   '/provider': (BuildContext context) => CounterProviderPage(),
      // },

      /* aquí se está haciendo de forma separada en una función aparte pero es lo mismo, es decir, espera los mismos parámetros pero se está haciendo de esta forma para modularizar las cosas y tener todo más ordenado y hacer la separación de responsabilidades. Colocando esta generación de rutas entonces ya no es necesario colocar las rutas que estaban arriba */
      /* se puede colocar la función completa pero darse cuenta que como el parámetro que se envía es igual al argumento que se recibe entonces se puede obviar colocar eso y solo colocar la referencia de la función tal cual se haría en JavaScript usando React por ejemplo */
      /* FORMA 1: sin usar paquetes pero solo sería para aplicaciones simples con rutas simples sin segmentos dinámicos ni query parameters  */
      // onGenerateRoute: (settings) => RouterGenerator.generateRoute(settings),
      // onGenerateRoute: RouteGenerator.generateRoute,

      /* FORMA 2: usando Fluro */
      // onGenerateRoute: (settings) => RouterWithFluro.router.generator(settings),
      onGenerateRoute: RouterWithFluro.router.generator,

      /* estamos utilizando un sistema para generar las rutas, es decir, tenemos la forma en cómo manejar el estado de nuestra navegación, pero para manejar ese estado de la navegación tenemos que hacer referencia al estado de navegación que ya se creó, es decir, tenemos una única instancia de nuestra navegación y tendremos que poner el key para el "navigatorKey" y con ese "navigatorKey" es con quien se hará la navegación porque es quien mantiene la referencia a la navegación que el "builder" está creando */
      /* cuando se hace el "Navigator.pushNamed(.....)" en teoría es buscar la referencia al "navigatorKey" y este es quien controla las rutas para poder navegar, etc. y para eso tenemos que especificarlo */
      /* aquí se está haciendo que el "locator<instancia_a_buscar>()" y luego de tener la instancia entonces se utiliza la propiedad "navigatorKey" */
      navigatorKey: locator<NavegationService>().navigatorKey,

      /* el "builder" es quien va a construir la ruta prácticamente, si no se coloca entonces por defecto trabaja con la ruta que genera en "onGenerateRoute: RouteGenerator.generateRoute," pero si se coloca explícitamente entonces el producto o lo que resulta de "onGenerateRoute: RouteGenerator.generateRoute," se le va a enviar al "builder" */
      builder: (buildContext, child) {
        /* se coloca el "child: child!" con "!" porque en -- builder: (BuildContext, Widget?) -- nos dice que puede ser opcional pero igual siempre lo vamos a recibir */
        // return MainLayoutPage(child: child!);

        /* también se puede colocar como una validación de que si no existe entonces no regrese otra cosa */
        // return MainLayoutPage(child: child ?? CircularProgressIndicator());
        return MainLayoutPage(child: child ?? Container());
      },
    );
  }
}
