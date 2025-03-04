import 'package:flutter/material.dart';
import 'package:flutter_web_bases/ui/shared/custom_app_menu.dart';

/* la diferencia de un Layout y un View es que el Layout se puede mostrar por sí solo usando un "Scaffold" y un View es un componente o widget que necesita o depende de otro widget que tenga el "Scaffold" */
class MainLayoutPage extends StatelessWidget {
  /* se va a recibir en el constructur un child de tipo Widget */
  final Widget child;

  const MainLayoutPage({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            CustomAppMenu(),
            Spacer(),

            /* Colocar las View */
            // child,
            /* se coloca de esta forma con el "Expanded(.....)" porque si se coloca directo el "child" entonces no va a saber cuánto espacio tomar o cuánto espacio tiene disponible para renderizar el Widget que viene, entonces con esto tomará todo el espacio sobrante que el "MainLayoutPage" pueda ofrecerle */
            Expanded(child: child),

            Spacer(),
          ],
        ),
      ),
    );
  }
}
