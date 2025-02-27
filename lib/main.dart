import 'package:flutter/material.dart';
import 'package:flutter_web_bases/ui/pages/counter_page.dart';

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
      routes: {'/stateful': (BuildContext context) => CounterPage()},
    );
  }
}
