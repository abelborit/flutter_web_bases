import 'package:flutter/material.dart';
import 'package:flutter_web_bases/ui/shared/custom_app_menu.dart';
import 'package:flutter_web_bases/ui/shared/custom_flat_button.dart';

/* cuando se trabaja con un provider o algún gestor de estado, usualmente no hace falta que sea un "StatefulWidget" porque con se un solo "StatelessWidget" nos va a funcionar */
class CounterProviderPage extends StatelessWidget {
  const CounterProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomAppMenu(),

          Spacer(), // widget usado para dar un espacio, el cual será el tamaño del espacio sobrante

          Text("Contador Provider", style: TextStyle(fontSize: 20)),

          FittedBox(
            /* para que tome al tamaño automático según el tamaño del dispositivo */
            fit: BoxFit.contain,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Contador: XXX",
                style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomFlatButton(
                text: "Incrementar",
                /* FORMA 1 */
                onPressed: () {},
                /* FORMA 2 */
                // onPressed: () {
                //   setState(() {
                //     counter++;
                //   });
                // },
              ),
              CustomFlatButton(
                text: "Decrementar",
                color: Colors.red,
                /* FORMA 1 */
                onPressed: () {},
                /* FORMA 2 */
                // onPressed: () {
                //   setState(() {
                //     counter++;
                //   });
                // },
              ),
            ],
          ),

          Spacer(), // widget usado para dar un espacio, el cual será el tamaño del espacio sobrante
        ],
      ),
    );
  }
}
