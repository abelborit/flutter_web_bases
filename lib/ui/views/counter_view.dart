import 'package:flutter/material.dart';
import 'package:flutter_web_bases/ui/shared/custom_flat_button.dart';

class CounterView extends StatefulWidget {
  final String baseCounter;

  const CounterView({super.key, required this.baseCounter});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int counter = 10;

  /* usaremos "initState" para inicializar un estado ya que no se puede hacer de forma directa como -- int counter = int.parse(widget.baseCounter); -- porque aún no está disponible en ese momento. El constructor de la clase no tiene acceso a widget, por lo que no podemos usar widget.baseCounter en la inicialización de counter. Pero cuando llegamos al método initState, ahí es cuando widget.baseCounter ya está disponible y podemos usarlo para inicializar counter */
  @override
  void initState() {
    super.initState();
    if (int.tryParse(widget.baseCounter) != null) {
      counter = int.parse(widget.baseCounter);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Contador Stateful", style: TextStyle(fontSize: 20)),

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
      ],
    );
  }
}
