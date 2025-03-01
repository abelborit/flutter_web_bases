import 'package:flutter/material.dart';
import 'package:flutter_web_bases/ui/pages/counter_page.dart';
import 'package:flutter_web_bases/ui/pages/counter_provider_page.dart';

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
      initialRoute: '/stateful',
      routes: {
        /* si no se está usando el BuildContext context se puede usar como "_" para hacer referencia a que no se está usando, pero en este caso lo vamos a dejar porque no nos causa mayor problema si se coloca o no */
        '/stateful': (BuildContext context) => CounterPage(),
        '/provider': (BuildContext context) => CounterProviderPage(),
      },
    );
  }
}
