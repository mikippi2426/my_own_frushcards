import 'package:flutter/material.dart';

class ButtonWithIcon extends StatelessWidget {
  final onPressed;
  final icon;
  final label;


  ButtonWithIcon({this.onPressed, this.icon,this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: null,
        icon: icon,
        label: Text(label));
  }
}
