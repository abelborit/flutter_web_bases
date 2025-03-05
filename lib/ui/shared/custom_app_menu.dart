import 'package:flutter/material.dart';
import 'package:flutter_web_bases/locator.dart';
import 'package:flutter_web_bases/services/navegation_service.dart';
import 'package:flutter_web_bases/ui/shared/custom_flat_button.dart';

class CustomAppMenu extends StatelessWidget {
  const CustomAppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // print("CustomAppMenu - render");

    /* detectar las dimensiones del dispositivo y tenga un estilo u otro usando el "LayoutBuilder" y se coloca el return antes porque hay que regresar un Widget */
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return (constraints.maxWidth > 520)
            ? _TabletDesktopAppMenu()
            : _MobileAppMenu();
      },
    );
  }
}

/* aquí se está extrayendo el widget para poder crear dos por separado, uno para tablet-desktop y el otro para mobile */
class _TabletDesktopAppMenu extends StatelessWidget {
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
            /* FORMA 1: forma tradicional: usando Fluro y el -- router.notFoundHandler -- veremos que en la "View404" funciona normal con el -- onPressed: () => Navigator.pushNamed(context, "/stateful"), -- pero si aquí colocamos o descomentamos el código de -- onPressed: () => Navigator.pushNamed(context, "/stateful"), -- veremos que no funciona y el por qué es que en el "View404" está dentro del contenedor de la ruta y ahí ya sabe dónde se encuentra el router y tiene la referencia al mismo porque al final solo estamos cambiando la vista o view y no todo, pero en el "CustomAppMenu" está siendo construido de una forma diferente que es el -- builder: (buildContext, child) { -- en el "main.dart" entonces ahí sí necesitamos el "navigatorKey" para que haga referencia a ese mismo y pueda navegar con normalidad */
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

          SizedBox(width: 10),
          CustomFlatButton(
            text: "Stateful 100",
            /* FORMA 1: forma tradicional */
            // onPressed: () => Navigator.pushNamed(context, "/pagina-no-existe"),
            /* FORMA 2: usando el navigatorKey */
            onPressed:
                () =>
                    locator<NavegationService>().navigationTo("/stateful/100"),
            color: Colors.black,
          ),

          SizedBox(width: 10),
          CustomFlatButton(
            text: "Provider 200",
            /* FORMA 1: forma tradicional */
            // onPressed: () => Navigator.pushNamed(context, "/pagina-no-existe"),
            /* FORMA 2: usando el navigatorKey */
            onPressed:
                () => locator<NavegationService>().navigationTo(
                  "/provider?q=200",
                ),
            color: Colors.black,
          ),

          SizedBox(width: 10),
          CustomFlatButton(
            text: "Stateful 100qweqwe",
            /* FORMA 1: forma tradicional */
            // onPressed: () => Navigator.pushNamed(context, "/pagina-no-existe"),
            /* FORMA 2: usando el navigatorKey */
            onPressed:
                () => locator<NavegationService>().navigationTo(
                  "/stateful/100qweqwe",
                ),
            color: Colors.black,
          ),

          SizedBox(width: 10),
          CustomFlatButton(
            text: "Provider 200qweqwe",
            /* FORMA 1: forma tradicional */
            // onPressed: () => Navigator.pushNamed(context, "/pagina-no-existe"),
            /* FORMA 2: usando el navigatorKey */
            onPressed:
                () => locator<NavegationService>().navigationTo(
                  "/provider?q=200qweqwe",
                ),
            color: Colors.black,
          ),

          SizedBox(width: 10),
          CustomFlatButton(
            text: "Dashboard User",
            /* FORMA 1: forma tradicional */
            // onPressed: () => Navigator.pushNamed(context, "/pagina-no-existe"),
            /* FORMA 2: usando el navigatorKey */
            onPressed:
                () => locator<NavegationService>().navigationTo(
                  "/dashboard/users/ABC123/admin",
                ),
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

class _MobileAppMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      color: Colors.cyan,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
