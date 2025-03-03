import 'package:flutter/material.dart';
import 'package:flutter_web_bases/ui/shared/custom_flat_button.dart';

class View404 extends StatelessWidget {
  const View404({super.key});

  @override
  Widget build(BuildContext context) {
    /* la diferencia con las pages es que las view no hacen uso del "Scaffold" */
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "404",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text("Page Not Found", style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          CustomFlatButton(
            text: "Regresar",
            onPressed: () => Navigator.pushNamed(context, "/stateful"),
          ),
        ],
      ),
    );
  }
}
