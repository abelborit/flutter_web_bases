import 'package:flutter/material.dart';
import 'package:flutter_web_bases/router/router_generator.dart';
// import 'package:flutter_web_bases/ui/pages/counter_page.dart';
// import 'package:flutter_web_bases/ui/pages/counter_provider_page.dart';

void main() => runApp(const MyApp());

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
      // onGenerateRoute: (settings) => RouterGenerator.generateRoute(settings),
      onGenerateRoute: RouterGenerator.generateRoute,
    );
  }
}
