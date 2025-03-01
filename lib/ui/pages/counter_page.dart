import 'package:flutter/material.dart';
import 'package:flutter_web_bases/ui/shared/custom_app_menu.dart';
import 'package:flutter_web_bases/ui/shared/custom_flat_button.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomAppMenu(),

          Spacer(), // widget usado para dar un espacio, el cual será el tamaño del espacio sobrante

          FittedBox(
            /* para que tome al tamaño automático según el tamaño del dispositivo */
            fit: BoxFit.contain,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Contador: $counter",
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
                onPressed: () => setState(() => counter++),
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
                onPressed: () => setState(() => counter--),
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
