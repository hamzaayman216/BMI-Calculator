import 'package:flutter/material.dart';


class RoundIconButton extends StatelessWidget {
  RoundIconButton(this.child, this.onPressed);
  final Widget child;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: child,
      elevation: 0.0,
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
