import 'package:flutter/material.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Contador: 5",
            style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
          ),

          TextButton(onPressed: () {}, child: Text("Incrementar")),
        ],
      ),
    );
  }
}
