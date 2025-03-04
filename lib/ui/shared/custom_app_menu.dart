import 'package:flutter/material.dart';
import 'package:flutter_web_bases/locator.dart';
import 'package:flutter_web_bases/services/navegation_service.dart';
import 'package:flutter_web_bases/ui/shared/custom_flat_button.dart';

class CustomAppMenu extends StatelessWidget {
  const CustomAppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // print("CustomAppMenu - render");

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      color: Colors.cyan,
      child: Row(
        children: [
          CustomFlatButton(
            text: "Contador Stateful",
            /* FORMA 1: forma tradicional */
            // onPressed: () => Navigator.pushNamed(context, "/stateful"),
            /* FORMA 2: usando el navigatorKey */
            onPressed:
                () => locator<NavegationService>().navigationTo("/stateful"),
            color: Colors.black,
          ),

          SizedBox(width: 10),
          CustomFlatButton(
            text: "Contador Provider",
            /* FORMA 1: forma tradicional */
            // onPressed: () => Navigator.pushNamed(context, "/provider"),
            /* FORMA 2: usando el navigatorKey */
            onPressed:
                () => locator<NavegationService>().navigationTo("/provider"),
            color: Colors.black,
          ),

          SizedBox(width: 10),
          CustomFlatButton(
            text: "Página que no existe",
            /* FORMA 1: forma tradicional */
            // onPressed: () => Navigator.pushNamed(context, "/pagina-no-existe"),
            /* FORMA 2: usando el navigatorKey */
            onPressed:
                () => locator<NavegationService>().navigationTo(
                  "/pagina-no-existe",
                ),
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
