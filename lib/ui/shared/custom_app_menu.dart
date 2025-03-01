import 'package:flutter/material.dart';
import 'package:flutter_web_bases/ui/shared/custom_flat_button.dart';

class CustomAppMenu extends StatelessWidget {
  const CustomAppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      color: Colors.cyan,
      child: Row(
        children: [
          CustomFlatButton(
            text: "Contador Stateful",
            onPressed: () => Navigator.pushNamed(context, "/stateful"),
            color: Colors.black,
          ),

          SizedBox(width: 10),
          CustomFlatButton(
            text: "Contador Provider",
            onPressed: () => Navigator.pushNamed(context, "/provider"),
            color: Colors.black,
          ),

          SizedBox(width: 10),
          CustomFlatButton(
            text: "Página que no existe",
            onPressed: () => Navigator.pushNamed(context, "/pagina-no-existe"),
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
