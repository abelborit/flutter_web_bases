import 'package:flutter/material.dart';
import 'package:flutter_web_bases/ui/shared/custom_flat_button.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int counter = 10;

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
