import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  /* para pasar argumentos y como es un "StatelessWidget" entonces quiere decir que no va a manejar estados, o al menos NO lo hará de forma directa, entonces el "final" es para tener como esas propiedades que no se van a cambiar de forma directa sino desde afuera o mejor dicho hasta que algún componente padre se redibuje o re-renderice y fuerce a este componente hijo a que se renderice de nuevo */
  final String text;
  final Color color;
  final Function onPressed;

  /* crear un constructor con los datos necesarios */
  const CustomFlatButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(foregroundColor: color),
      onPressed: () => onPressed(),
      child: Padding(padding: const EdgeInsets.all(8.0), child: Text(text)),
    );
  }
}
