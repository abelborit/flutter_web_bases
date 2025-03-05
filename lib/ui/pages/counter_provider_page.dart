import 'package:flutter/material.dart';
import 'package:flutter_web_bases/providers/counter_provider.dart';
import 'package:flutter_web_bases/ui/shared/custom_app_menu.dart';
import 'package:flutter_web_bases/ui/shared/custom_flat_button.dart';
import 'package:provider/provider.dart';

/* cuando se trabaja con un provider o algún gestor de estado, usualmente no hace falta que sea un "StatefulWidget" porque con se un solo "StatelessWidget" nos va a funcionar */
class CounterProviderPage extends StatelessWidget {
  const CounterProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CounterProvider("5"),
      child: _CounterProviderPageBody(),
    );
  }
}

/* se extrae a una clase separada para poder trabajarlo de mejor forma con los providers pero no siempre se utilizará esta forma de extraer, algunas veces puede ser de forma directa o de alguna otra forma según el caso */
class _CounterProviderPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /* hacer referencia al provider que se quiere usar implementando el Provider.of<instancia_de_nuestro_provider>(context) */
    final counterProvider = Provider.of<CounterProvider>(context);

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
                "Contador: ${counterProvider.counter}", // se coloca ${.....} porque se va a acceder a una propiedad
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
                onPressed: () => counterProvider.increment(),
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
                onPressed: () => counterProvider.decrement(),
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
