import 'package:flutter/material.dart';
import 'package:flutter_web_bases/ui/shared/custom_app_menu.dart';

/* la diferencia de un Layout y un View es que el Layout se puede mostrar por sí solo usando un "Scaffold" y un View es un componente o widget que necesita o depende de otro widget que tenga el "Scaffold" */
class MainLayoutPage extends StatelessWidget {
  const MainLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            CustomAppMenu(),
            Spacer(),

            /* Colocar las View */
            Spacer(),
          ],
        ),
      ),
    );
  }
}
